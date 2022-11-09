select id as 'Competitor Id',
	   name as 'Name Surname',
	   atl.noc as 'Country Abbr.',
	   teaminfo.team as Country,
	   case when sex='M' then 'male' else 'female' end as Gender,
	   age,
	   case when age is null then 'unknown'
			when age between 20 and 30 then 'young'
			when age between 31 and 40 then 'middle age'
			when age between 41 and 50 then 'over aged'
			when age between 51 and 100 then 'old'
		end as 'Age Range',
		case when height is null then 'unknown'
			 when height between 130 and 170 then 'short'
			 when height between 171 and 185 then 'middle height'
			 when height between 186 and 230 then 'tall'
		end as 'Height Range',
		case when weight is null then 'unknown'
			 when weight between 40 and 60 then 'light weight'
			 when weight between 61 and 90 then 'middle weight'
			 when weight between 91 and 250 then 'heavy'
		end as 'Weight Range',
		substring(games,1,4) as 'Year Of Games',
		substring(games,6,6) as 'Season Of Games',
		sport,
		case when medal is null then 'unknown'
			 when medal='Gold' then 'Gold'
			 when medal='Siver' then 'Silver'
			 else 'Bronze'
		end as 'Medal Category'	
from atl inner join teaminfo on teaminfo.noc=atl.noc
where substring(games,6,6) = 'summer'
order by substring(games,1,4),name,medal