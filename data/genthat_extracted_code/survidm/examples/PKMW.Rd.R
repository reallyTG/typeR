library(survidm)


### Name: PKMW
### Title: Presmoothed Kaplan-Meier weights
### Aliases: PKMW

### ** Examples

obj <- with(colonIDM, survIDM(time1, event1, Stime, event))
PKMW(time = obj$Stime, status = obj$event)



