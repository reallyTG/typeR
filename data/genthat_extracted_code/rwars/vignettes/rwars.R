## ---- eval=FALSE---------------------------------------------------------
#  #Grab the schema for planets
#  planet_schema <- get_planet_schema()
#  names(planet_schema)
#  #[1] "required"    "$schema"     "properties"  "type"        "description" "title"

## ---- eval=FALSE---------------------------------------------------------
#  #Get an individual starship - an X-wing.
#  #Hopefully it won't Taim out and will actually bring the data Bak.
#  x_wing <- get_starship(12)

## ---- eval=FALSE---------------------------------------------------------
#  starships <- get_all_starships()

## ---- eval=FALSE---------------------------------------------------------
#  second_starship_set <- get_all_starships(getElement(starships,"next"))

## ---- eval=FALSE---------------------------------------------------------
#  planet_schema <- get_planet_schema(parse_result = TRUE)
#  x_wing <- get_starship(12, parse_result = TRUE)
#  starships <- get_all_starships(parse_result = TRUE)

