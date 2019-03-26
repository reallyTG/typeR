library(MEMSS)


### Name: Glucose2
### Title: Glucose Levels Following Alcohol Ingestion
### Aliases: Glucose2
### Keywords: datasets

### ** Examples

require(lattice)
str(Glucose2)
xyplot(glucose ~ Time | Subject, Glucose2, type = c("g", "b"),
       groups = Date, aspect = 'xy', layout = c(4,2),
       index.cond = function(x,y) max(y))



