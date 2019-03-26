library(repurrrsive)


### Name: sw_people
### Title: Entities from the Star Wars Universe
### Aliases: sw_people sw_films sw_planets sw_species sw_vehicles
###   sw_starships
### Keywords: datasets

### ** Examples

# sw_people
length(sw_people)
names(sw_people[[1]])
sapply(sw_people, `[[`, "name")

# sw_films
length(sw_films)
names(sw_films[[1]])
sapply(sw_films, `[[`, "title")



