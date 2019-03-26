library(survidm)


### Name: PKM
### Title: Presmoothed Kaplan-Meier product-limit estimate of survival
### Aliases: PKM

### ** Examples

obj <- with(colonIDM, survIDM(time1, event1, Stime, event))
PKM(time = obj$Stime, status = obj$event, t = 1095)



