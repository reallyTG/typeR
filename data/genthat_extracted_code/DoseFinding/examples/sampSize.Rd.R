library(DoseFinding)


### Name: sampSize
### Title: Sample size calculations
### Aliases: sampSize sampSizeMCT targN plot.targN powN

### ** Examples

## sampSize examples

## first define the target function
## first calculate the power to detect all of the models in the candidate set
fmodels <- Mods(linear = NULL, emax = c(25),                            
                logistic = c(50, 10.88111), exponential=c(85),          
                betaMod=matrix(c(0.33,2.31,1.39,1.39), byrow=TRUE, nrow=2),
                doses = c(0,10,25,50,100,150), placEff=0, maxEff=0.4,
                addArgs = list(scal=200))
## contrast matrix to use
contMat <- optContr(fmodels, w=1)
## this function calculates the power under each model and then returns
## the average power under all models
tFunc <- function(n){
  powVals <- powMCT(contMat, altModels=fmodels, n=n, sigma = 1,
                    alpha=0.05)
  mean(powVals)
}

## assume we want to achieve 80% average power over the selected shapes
## and want to use a balanced allocations
## Not run: 
##D sSize <- sampSize(upperN = 80, targFunc = tFunc, target=0.8, 
##D                   alRatio = rep(1,6), verbose = TRUE)
##D sSize
##D 
##D 
##D ## Now the same using the convenience sampSizeMCT function 
##D sampSizeMCT(upperN=80, contMat = contMat, sigma = 1, altModels=fmodels,
##D             power = 0.8, alRatio = rep(1, 6), alpha = 0.05)
##D ## Alternatively one can also specify an S matrix
##D ## covariance matrix in one observation (6 total observation result in a
##D ## variance of 1 in each group)
##D S <- 6*diag(6)
##D ## this uses df = Inf, hence a slightly smaller sample size results
##D sampSizeMCT(upperN=500, contMat = contMat, S=S, altModels=fmodels,
##D             power = 0.8, alRatio = rep(1, 6), alpha = 0.05, Ntype = "total")
##D 
##D 
##D ## targN examples
##D ## first calculate the power to detect all of the models in the candidate set
##D fmodels <- Mods(linear = NULL, emax = c(25),                            
##D                 logistic = c(50, 10.88111), exponential=c(85),          
##D                 betaMod=matrix(c(0.33,2.31,1.39,1.39), byrow=TRUE, nrow=2),
##D                 doses = c(0,10,25,50,100,150), placEff=0, maxEff=0.4,
##D                 addArgs = list(scal=200))
##D ## corresponding contrast matrix
##D contMat <- optContr(fmodels, w=1)
##D ## define target function
##D tFunc <- function(n){
##D   powMCT(contMat, altModels=fmodels, n=n, sigma = 1, alpha=0.05)
##D }
##D powVsN <- targN(upperN = 100, lowerN = 10, step = 10, tFunc,
##D                 alRatio = rep(1, 6))
##D plot(powVsN)
##D 
##D ## the same can be achieved using the convenience powN function
##D ## without the need to specify a target function
##D powN(upperN = 100, lowerN=10, step = 10, contMat = contMat,
##D      sigma = 1, altModels = fmodels, alpha = 0.05, alRatio = rep(1, 6))
## End(Not run)



