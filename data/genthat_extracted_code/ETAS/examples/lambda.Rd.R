library(ETAS)


### Name: lambda
### Title: Clustering Part of Conditional Intensity Function of the ETAS
###   Model
### Aliases: lambda
### Keywords: spatial math earthquake modeling

### ** Examples


  iran.cat <- catalog(iran.quakes, time.begin="1973/01/01",
     study.start="1996/01/01", study.end="2016/01/01",
     lat.range=c(25, 42), long.range=c(42, 63), mag.threshold=4.5)

  param <- c(0.46, 0.23, 0.022, 2.8, 1.12, 0.012, 2.4, 0.35)

  ## Not run: 
##D   lambda(15706, 40.12, 34.5, param, iran.cat)
## End(Not run)




