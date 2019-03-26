library(ODEnetwork)


### Name: createEvents
### Title: Creates Events
### Aliases: createEvents

### ** Examples

if (interactive()) {
  masses <- 1
  dampers <- as.matrix(1.5)
  springs <- as.matrix(4)
  odenet <- ODEnetwork(masses, dampers, springs)
  eventdat <- data.frame(  var = c("x.1", "x.1")
                         , time = c(1, 3)
                         , value = c(1, 3)
                         )
  odenet <- setState(odenet, 0, 0)
  odenet <- setEvents(odenet, eventdat)
  createEvents(odenet)
}



