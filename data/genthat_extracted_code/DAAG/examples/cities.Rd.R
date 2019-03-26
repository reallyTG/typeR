library(DAAG)


### Name: cities
### Title: Populations of Major Canadian Cities (1992-96)
### Aliases: cities
### Keywords: datasets

### ** Examples

cities$have <- factor((cities$REGION=="ON")|(cities$REGION=="WEST"))
plot(POP1996~POP1992, data=cities, col=as.integer(cities$have))



