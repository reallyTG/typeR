library(sfsmisc)


### Name: p.tachoPlot
### Title: Draw Symbol on a Plot
### Aliases: p.tachoPlot
### Keywords: hplot

### ** Examples

data(state)
data(USArrests)
p.tachoPlot(state.center $x, state.center $y, USArrests[,"UrbanPop"])

data(mtcars)
par(mfrow=c(2,2))
## see the difference between the three methods (not much differ. here!)
p.tachoPlot(mtcars$hp, mtcars$disp, mtcars$mpg, method="sens")
p.tachoPlot(mtcars$hp, mtcars$disp, mtcars$mpg, method="rank")
p.tachoPlot(mtcars$hp, mtcars$disp, mtcars$mpg, method="rob")



