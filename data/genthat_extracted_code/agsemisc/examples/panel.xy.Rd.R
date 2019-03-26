library(agsemisc)


### Name: panel.xy
### Title: Flexible panel.xyplot replacement
### Aliases: panel.xy panel.lminterval
### Keywords: aplot

### ** Examples

# set  grid.prompt(TRUE)  to see each plot separately (click graphics window)
data(iris)
a.resetplotparams()
print(xyplot(Sepal.Width ~ Sepal.Length|Species, data=iris,
             panel=panel.xy, type="p,grid,v,lqs,r.pred,loess"))
print(xyplot(Sepal.Width ~ Sepal.Length, data=iris, groups=Species,
             panel=panel.superpose, panel.groups=panel.xy,
             type=c("p","grid","v","loess"), unicolor=TRUE))



