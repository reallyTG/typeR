library(condSURV)


### Name: PKMW
### Title: Presmoothed Kaplan-Meier weights.
### Aliases: PKMW

### ** Examples

obj <- with(colonCS, survCS(time1, event1, Stime, event))
PKMW(time = obj$Stime, status = obj$event)



