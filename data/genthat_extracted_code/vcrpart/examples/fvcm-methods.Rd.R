library(vcrpart)


### Name: fvcm-methods
### Title: Methods for 'fvcm' objects
### Aliases: fvcm-methods fitted.fvcm print.fvcm oobloss.fvcm plot.fvcm
###   predict.fvcm print.fvcm ranef.fvcm
### Keywords: methods hplot

### ** Examples


## ------------------------------------------------------------------- #
## Dummy example 1:
##
## Fitting a random forest tvcm on artificially generated ordinal
## longitudinal data. The parameters 'maxstep = 1' and 'K = 2' are     
## chosen to restrict the computations.
## ------------------------------------------------------------------- # 

## load the data

data(vcrpart_1)

## fit and analyse the model

control <-
  fvcolmm_control(mtry = 2, maxstep = 1, 
                  folds = folds_control(type = "subsampling", K = 2, prob = 0.75))

model.1 <-
  fvcolmm(y ~ -1 + wave + vc(z3, z4, by = treat, intercept = TRUE) + re(1|id),
          family = cumulative(), subset = 1:100,
          data = vcrpart_1, control = control)

## estimating the out of bag loss
suppressWarnings(oobloss(model.1))

## predicting responses and varying coefficients for subject '27'
subs <- vcrpart_1$id == "27"

## predict coefficients
predict(model.1, newdata = vcrpart_1[subs,], type = "coef")

## marginal response prediction
predict(model.1, vcrpart_1[subs,], "response", ranef = FALSE)

## conditional response prediction
re <- matrix(5, 1, 1, dimnames = list("27", "(Intercept)"))
predict(model.1, vcrpart_1[subs,], "response", ranef = re)
predict(model.1, vcrpart_1[subs,], "response", ranef = 0 * re)

## predicting in-sample random effects
head(predict(model.1, type = "ranef"))

## fitted responses (marginal and conditional prediction)
head(predict(model.1, type = "response", ranef = FALSE))
head(predict(model.1, type = "response", ranef = TRUE))


## ------------------------------------------------------------------- #
## Dummy example 2:
##
## Fitting a random forest tvcm on artificially generated normally
## distributed data. The parameters 'maxstep = 3' and 'K = 3' are
## chosen to restrict the computations and 'minsize = 5' to obtain at
## least a few splits given the small sample size.
## ------------------------------------------------------------------- #

data(vcrpart_2)

## fit and analyse the model

control <- fvcm_control(mtry = 1L, minsize = 5, maxstep = 3,
                        folds_control("subsampling", K = 3, 0.75))

model.2 <- fvcglm(y ~ -1  + vc(z1, z2, by = x1, intercept = TRUE) + x2,
                  data = vcrpart_2,
                  family = gaussian(), subset = 1:50,control = control)

## estimating the out of bag loss
suppressWarnings(oobloss(model.2))

## predict the coefficient for individual cases
predict(model.2, vcrpart_2[91:100, ], "coef")



