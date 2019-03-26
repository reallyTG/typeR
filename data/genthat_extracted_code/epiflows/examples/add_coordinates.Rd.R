library(epiflows)


### Name: add_coordinates
### Title: Add/Retrieve location coordinates
### Aliases: add_coordinates get_coordinates get_coordinates.epiflows

### ** Examples


# Setting up the data
data("Brazil_epiflows")
data("YF_coordinates")
get_coordinates(Brazil_epiflows) # no coordinates yet
ef <- add_coordinates(Brazil_epiflows, YF_coordinates[-1])
get_coordinates(ef)
get_coordinates(ef, location = "Espirito Santo") # coordinates for Espirito Santo
## No test: 
  # You can use google maps' geocode functionality if you have a decent 
  # internet connection
  ef2 <- add_coordinates(Brazil_epiflows, loc_column = "id")
  ef2
## End(No test)




