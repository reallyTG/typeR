library(MEMSS)


### Name: Glucose
### Title: Glucose levels over time
### Aliases: Glucose
### Keywords: datasets

### ** Examples

require(lattice)
str(Glucose)
xyplot(conc ~ Time | Meal * Subject, Glucose)



