library(rwars)


### Name: get_all_planets
### Title: Retrieve Data about Every DB Entry in a Class
### Aliases: all_entries get_all_films get_all_people get_all_planets
###   get_all_species get_all_starships get_all_vehicles

### ** Examples

#Retrieve all planets, parsing
planets <- get_all_planets(parse_result = TRUE)

#It's only returned some of the results! Use query_continue to get
#the rest.
second_set_of_planets <- get_all_planets(getElement(planets,"next"), parse_result = TRUE)




