library(agsemisc)


### Name: panel.bwstrip
### Title: Flexible panel.bwplot replacement
### Aliases: panel.bwstrip
### Keywords: aplot

### ** Examples

# set  grid.prompt(TRUE)  to see each plot separately (click graphics window)
data(iris)
a.resetplotparams()
print(bwplot(Species~Sepal.Length, data=iris, panel=panel.bwstrip))
# A plot including a density plot:
print(bwplot(Species~Sepal.Length, data=iris, panel=panel.bwstrip,
             type="mean,strip,density"))
# A customized plot:
print(bwplot(~Sepal.Length, data=iris, panel=panel.bwstrip, 
             groups=Species, pch=levels(iris$Species), strip.limit=200,
             type="mean,strip,density", 
             densityplot=expression(density(X, cut=1))))
# A conventional-style plot:
print(bwplot(Species~Sepal.Length, data=iris, panel=panel.bwstrip,
             type="mean,strip,grid", strip.limit=TRUE, whiskerpos=1.5,
             densityplot=expression(density(X, cut=1))))
# A plot showing some other features:
print(bwplot(cut(Sepal.Width,4)~Sepal.Length, data=iris, panel=panel.bwstrip,
             groups=Species, varwidth=TRUE, box.ratio=20, 
             which="strip,N", strip.limit=50, pch="1,2,3"))



