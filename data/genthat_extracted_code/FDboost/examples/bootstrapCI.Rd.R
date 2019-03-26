library(FDboost)


### Name: bootstrapCI
### Title: Function to compute bootstrap confidence intervals
### Aliases: bootstrapCI

### ** Examples

if(require(refund)){
#########
# model with linear functional effect, use bsignal()
# Y(t) = f(t) + \int X1(s)\beta(s,t)ds + eps
set.seed(2121)
data1 <- pffrSim(scenario = "ff", n = 40)
data1$X1 <- scale(data1$X1, scale = FALSE)
dat_list <- as.list(data1)
dat_list$t <- attr(data1, "yindex")
dat_list$s <- attr(data1, "xindex")

## model fit by FDboost 
m1 <- FDboost(Y ~ 1 + bsignal(x = X1, s = s, knots = 8, df = 3), 
              timeformula = ~ bbs(t, knots = 8), data = dat_list)

}
              
## Not run: 
##D              
##D # a short toy example with to few folds  
##D # and up to 200 boosting iterations 
##D bootCIs <- bootstrapCI(m1[200], B_inner = 2, B_outer = 5) 
##D 
##D # look at stopping iterations
##D bootCIs$mstops
##D 
##D # plot bootstrapped coefficient estimates
##D plot(bootCIs, ask = FALSE)
## End(Not run)

## now speed things up by defining the inner resampling
## function with parallelization based on mclapply (does not work on Windows)

my_inner_fun <- function(object){ 
cvrisk(object, folds = cvLong(id = object$id, weights = 
model.weights(object), 
B = 10 # 10-fold for inner resampling
), mc.cores = 10) # use ten cores
}

## Not run: 
##D bootCIs <- bootstrapCI(m1, resampling_fun_inner = my_inner_fun)
## End(Not run)

## We can also use the ... argument to parallelize the applyFolds
## function in the outer resampling 

## Not run: 
##D bootCIs <- bootstrapCI(m1, mc.cores = 30)
## End(Not run)

## Now let's parallelize the outer resampling and use 
## crossvalidation instead of bootstrap for the inner resampling

my_inner_fun <- function(object){ 
cvrisk(object, folds = cvLong(id = object$id, weights = 
model.weights(object), type = "kfold", # use CV
B = 10, # 10-fold for inner resampling
),
mc.cores = 10) # use ten cores
}

# use applyFolds for outer function to avoid messing up weights
my_outer_fun <- function(object, fun){
applyFolds(object = object,
folds = cv(rep(1, length(unique(object$id))), 
type = "bootstrap", B = 100), fun = fun,
mc.cores = 10) # parallelize on 10 cores
}

######## Example for scalar-on-function-regression with bsignal() 
data("fuelSubset", package = "FDboost")

## center the functional covariates per observed wavelength
fuelSubset$UVVIS <- scale(fuelSubset$UVVIS, scale = FALSE)
fuelSubset$NIR <- scale(fuelSubset$NIR, scale = FALSE)

## to make mboost:::df2lambda() happy (all design matrix entries < 10)
## reduce range of argvals to [0,1] to get smaller integration weights
fuelSubset$uvvis.lambda <- with(fuelSubset, (uvvis.lambda - min(uvvis.lambda)) /
(max(uvvis.lambda) - min(uvvis.lambda) ))
fuelSubset$nir.lambda <- with(fuelSubset, (nir.lambda - min(nir.lambda)) /
(max(nir.lambda) - min(nir.lambda) ))

## model fit with scalar response and two functional linear effects 
## include no intercept as all base-learners are centered around 0    

mod2 <- FDboost(heatan ~ bsignal(UVVIS, uvvis.lambda, knots = 40, df = 4, check.ident = FALSE) 
               + bsignal(NIR, nir.lambda, knots = 40, df=4, check.ident = FALSE), 
               timeformula = NULL, data = fuelSubset) 


## Not run: 
##D # takes some time, because of defaults: B_outer = 100, B_inner = 25
##D bootCIs <- bootstrapCI(mod2)
## End(Not run)

## run with a larger number of outer bootstrap samples
## and only 10-fold for validation of each outer fold
## WARNING: This may take very long!
## Not run: 
##D bootCIs <- bootstrapCI(mod2, B_outer = 1000, B_inner = 10)
## End(Not run)




