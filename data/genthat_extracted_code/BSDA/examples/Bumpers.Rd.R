library(BSDA)


### Name: Bumpers
### Title: Repair costs of vehicles crashed into a barrier at 5 miles per
###   hour
### Aliases: Bumpers
### Keywords: datasets

### ** Examples


EDA(Bumpers$repair)
stripchart(Bumpers$repair, method = "stack", pch = 19, col = "blue")
library(lattice)
dotplot(car ~ repair, data = Bumpers)




