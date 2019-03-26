library(ppsbm)


### Name: generateDynppsbmConst
### Title: Data under dynppsbm with piecewise constant intensities
### Aliases: generateDynppsbmConst

### ** Examples

intens1 <- c(1,3,8)
intens2 <- c(2,3,6)

intens <- matrix(c(intens1,intens2,intens1,intens2),4,3)

Time <- 10
n <- 20
prop.groups <- c(0.2,0.3)
dynppsbm <- generateDynppsbmConst(intens,Time,n,prop.groups,directed=TRUE)




