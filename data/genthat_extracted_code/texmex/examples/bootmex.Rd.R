library(texmex)


### Name: bootmex
### Title: Bootstrap a conditional multivariate extreme values model
### Aliases: bootmex print.bootmex plot.bootmex
### Keywords: models multivariate

### ** Examples


## No test: 
mymex <- mex(winter , mqu = .7, dqu = .7, which = "NO")
myboot <- bootmex(mymex)
myboot
plot(myboot,plots="gpd")
plot(myboot,plots="dependence")
## End(No test) 



