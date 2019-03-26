library(automap)


### Name: autoKrige.cv
### Title: Automatic cross-validation
### Aliases: autoKrige.cv

### ** Examples

data(meuse)
coordinates(meuse) = ~x+y
data(meuse.grid)
gridded(meuse.grid) = ~x+y

kr.cv = autoKrige.cv(log(zinc)~1, meuse, model = c("Exp"), nfold = 10)
kr_dist.cv = autoKrige.cv(log(zinc)~sqrt(dist), meuse, 
       model = c("Exp"), nfold = 10)
kr_dist_ffreq.cv = autoKrige.cv(log(zinc)~sqrt(dist)+ffreq, 
       meuse, model = c("Exp"), nfold = 10)



