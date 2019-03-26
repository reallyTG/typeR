library(cem)


### Name: imbspace.plot
### Title: Plot of imbalance space diagnostic tool for CEM
### Aliases: imbspace.plot
### Keywords: datagen

### ** Examples

## Not run: 
##D require(cem)
##D 
##D data(LL)
##D 
##D mat <- cem("treated", LL, drop=c("re78","treated"), 
##D  cut=list(age=4, edu=4, re74=3, re75=3))
##D mat
##D 
##D imb.raw <- L1.profile(LL$treated, LL[, mat$vars], M=250, plot=FALSE)
##D 
##D imbsp <- imbspace(mat, LL,depth=2, raw.profile=imb.raw, 
##D  maximal=6, minimal=2, fixed=c("hispanic", "black", "married", 
##D  "nodegree","u74","u75"), plot=FALSE)
##D 
##D tmp <- plot(imbsp,data=LL,explore=interactive())
##D tmp 
## End(Not run)



