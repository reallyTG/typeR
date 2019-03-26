library(FDboost)


### Name: bhistx
### Title: Base-learners for Functional Covariates
### Aliases: bhistx
### Keywords: models

### ** Examples

if(require(refund)){
## simulate some data from a historical model
## the interaction effect is in this case not necessary
n <- 100
nygrid <- 35
data1 <- pffrSim(scenario = c("int", "ff"), limits = function(s,t){ s <= t }, 
                n = n, nygrid = nygrid)
data1$X1 <- scale(data1$X1, scale = FALSE) ## center functional covariate                  
dataList <- as.list(data1)
dataList$tvals <- attr(data1, "yindex")

## create the hmatrix-object
X1h <- with(dataList, hmatrix(time = rep(tvals, each = n), id = rep(1:n, nygrid), 
                             x = X1, argvals = attr(data1, "xindex"), 
                             timeLab = "tvals", idLab = "wideIndex", 
                             xLab = "myX", argvalsLab = "svals"))
dataList$X1h <- I(X1h)   
dataList$svals <- attr(data1, "xindex")
## add a factor variable 
dataList$zlong <- factor(gl(n = 2, k = n/2, length = n*nygrid), levels = 1:3)  
dataList$z <- factor(gl(n = 2, k = n/2, length = n), levels = 1:3)

## do the model fit with main effect of bhistx() and interaction of bhistx() and bolsc()
mod <- FDboost(Y ~ 1 + bhistx(x = X1h, df = 5, knots = 5) + 
               bhistx(x = X1h, df = 5, knots = 5) %X% bolsc(zlong), 
              timeformula = ~ bbs(tvals, knots = 10), data = dataList)
              
## alternative parameterization: interaction of bhistx() and bols()
mod <- FDboost(Y ~ 1 + bhistx(x = X1h, df = 5, knots = 5) %X% bols(zlong), 
              timeformula = ~ bbs(tvals, knots = 10), data = dataList)

## Not run: 
##D   # find the optimal mstop over 5-fold bootstrap (small example to reduce run time)
##D   cv <- cvrisk(mod, folds = cv(model.weights(mod), B = 5))
##D   mstop(cv)
##D   mod[mstop(cv)]
##D   
##D   appl1 <- applyFolds(mod, folds = cv(rep(1, length(unique(mod$id))), type = "bootstrap", B = 5))
##D 
##D  # plot(mod)
## End(Not run)
}




