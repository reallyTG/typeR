library(sampSurf)


### Name: spCircle
### Title: Create a Circular Spatial Object
### Aliases: spCircle
### Keywords: ~kwd1 ~kwd2

### ** Examples

dbh = 20
sp.dbh = spCircle(dbh/2, centerPoint=c(x=30,y=80), spID='tree.1') 
plot(sp.dbh$spCircle)
plot(sp.dbh$location, add=TRUE, pch=3)



