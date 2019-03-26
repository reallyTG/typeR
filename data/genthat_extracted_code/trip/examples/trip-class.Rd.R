library(trip)


### Name: trip-class
### Title: A class for sets of animal trips (track data).
### Aliases: lines,trip-method plot,trip,missing-method
###   show,summary.TORdata-method show,trip-method subset,trip-method
###   summary,trip-method trip-class
### Keywords: classes

### ** Examples



showClass("trip")

## Examples of general methods
## Continuing the example from '?trip-methods:
utils::example("trip-methods", package="trip",
               ask=FALSE, echo=FALSE)
summary(tr)
plot(tr)
lines(tr)

dim(tr)
names(tr)
subset(tr, id == "2")
as.data.frame(tr)

tr[1:3, ]
tr[, 1]
tr[[1]]

if (exists("porpoise")) {
    dim(porpoise)
    names(porpoise)
    porpoise[porpoise[["id"]] == "GUS", ]
}





