library(shapes)


### Name: shapes.cva
### Title: Canonical variate analysis for shapes
### Aliases: shapes.cva
### Keywords: multivariate

### ** Examples


#2D example : female and male apes   (cf. Dryden and Mardia, 2016)

data(pongof.dat)
data(pongom.dat) 
data(panm.dat)
data(panf.dat)

apes   <- groupstack( pongof.dat , pongom.dat , panm.dat, panf.dat )

shapes.cva( apes$x, apes$groups) 



