library(personalized)


### Name: fit.subgroup
### Title: Fitting subgroup identification models
### Aliases: fit.subgroup

### ** Examples

library(personalized)

set.seed(123)
n.obs  <- 500
n.vars <- 15
x <- matrix(rnorm(n.obs * n.vars, sd = 3), n.obs, n.vars)


# simulate non-randomized treatment
xbetat   <- 0.5 + 0.5 * x[,7] - 0.5 * x[,9]
trt.prob <- exp(xbetat) / (1 + exp(xbetat))
trt01    <- rbinom(n.obs, 1, prob = trt.prob)

trt      <- 2 * trt01 - 1

# simulate response
# delta below drives treatment effect heterogeneity
delta <- 2 * (0.5 + x[,2] - x[,3] - x[,11] + x[,1] * x[,12] )
xbeta <- x[,1] + x[,11] - 2 * x[,12]^2 + x[,13] + 0.5 * x[,15] ^ 2
xbeta <- xbeta + delta * trt

# continuous outcomes
y <- drop(xbeta) + rnorm(n.obs, sd = 2)

# binary outcomes
y.binary <- 1 * (xbeta + rnorm(n.obs, sd = 2) > 0 )

# count outcomes
y.count <- round(abs(xbeta + rnorm(n.obs, sd = 2)))

# time-to-event outcomes
surv.time <- exp(-20 - xbeta + rnorm(n.obs, sd = 1))
cens.time <- exp(rnorm(n.obs, sd = 3))
y.time.to.event  <- pmin(surv.time, cens.time)
status           <- 1 * (surv.time <= cens.time)

# create function for fitting propensity score model
prop.func <- function(x, trt)
{
    # fit propensity score model
    propens.model <- cv.glmnet(y = trt,
                               x = x, family = "binomial")
    pi.x <- predict(propens.model, s = "lambda.min",
                    newx = x, type = "response")[,1]
    pi.x
}


####################  Continuous outcomes ################################


subgrp.model <- fit.subgroup(x = x, y = y,
                           trt = trt01,
                           propensity.func = prop.func,
                           loss   = "sq_loss_lasso",
                           nfolds = 10)              # option for cv.glmnet

summary(subgrp.model)

# estimates of the individual-specific
# treatment effect estimates:
subgrp.model$individual.trt.effects

# fit lasso + gam model with REML option for gam

## No test: 
subgrp.modelg <- fit.subgroup(x = x, y = y,
                            trt = trt01,
                            propensity.func = prop.func,
                            loss   = "sq_loss_lasso_gam",
                            method.gam = "REML",     # option for gam
                            nfolds = 5)              # option for cv.glmnet

subgrp.modelg
## End(No test)

####################  Using an augmentation function #####################
## augmentation funcions involve modeling the conditional mean E[Y|T, X]
## and returning predictions that are averaged over the treatment values
## return <- 1/2 * (hat{E}[Y|T=1, X] + hat{E}[Y|T=-1, X])
##########################################################################

augment.func <- function(x, y, trt) {
    data <- data.frame(x, y, trt)
    xm <- model.matrix(y~trt*x-1, data = data)

    lmod <- cv.glmnet(y = y, x = xm)
    ## get predictions when trt = 1
    data$trt <- 1
    xm <- model.matrix(y~trt*x-1, data = data)
    preds_1  <- predict(lmod, xm, s = "lambda.min")

    ## get predictions when trt = -1
    data$trt <- -1
    xm <- model.matrix(y~trt*x-1, data = data)
    preds_n1  <- predict(lmod, xm, s = "lambda.min")

    ## return predictions averaged over trt
    return(0.5 * (preds_1 + preds_n1))
}

## No test: 
subgrp.model.aug <- fit.subgroup(x = x, y = y,
                           trt = trt01,
                           propensity.func = prop.func,
                           augment.func    = augment.func,
                           loss   = "sq_loss_lasso",
                           nfolds = 10)              # option for cv.glmnet

summary(subgrp.model.aug)
## End(No test)

####################  Binary outcomes ####################################

# use logistic loss for binary outcomes
subgrp.model.bin <- fit.subgroup(x = x, y = y.binary,
                           trt = trt01,
                           propensity.func = prop.func,
                           loss   = "logistic_loss_lasso",
                           type.measure = "auc",    # option for cv.glmnet
                           nfolds = 5)              # option for cv.glmnet

subgrp.model.bin


####################  Count outcomes #####################################

# use poisson loss for count/poisson outcomes
subgrp.model.poisson <- fit.subgroup(x = x, y = y.count,
                           trt = trt01,
                           propensity.func = prop.func,
                           loss   = "poisson_loss_lasso",
                           type.measure = "mse",    # option for cv.glmnet
                           nfolds = 5)              # option for cv.glmnet

subgrp.model.poisson


####################  Time-to-event outcomes #############################

library(survival)
## No test: 
subgrp.model.cox <- fit.subgroup(x = x, y = Surv(y.time.to.event, status),
                           trt = trt01,
                           propensity.func = prop.func,
                           loss   = "cox_loss_lasso",
                           nfolds = 5)              # option for cv.glmnet

subgrp.model.cox
## End(No test)


####################  Using custom loss functions ########################

## Use custom loss function for binary outcomes

fit.custom.loss.bin <- function(x, y, weights, offset, ...) {
    df <- data.frame(y = y, x)

    # minimize logistic loss with NO lasso penalty
    # with allowance for efficiency augmentation
    glmf <- glm(y ~ x - 1, weights = weights,
                offset = offset, # offset term allows for efficiency augmentation
                family = binomial(), ...)

    # save coefficients
    cfs = coef(glmf)

    # create prediction function.
    prd = function(x, type = "response") {
         dfte <- cbind(1, x)
         colnames(dfte) <- names(cfs)
         ## predictions must be returned on the scale
         ## of the linear predictor
         predict(glmf, data.frame(dfte), type = "link")
    }
    # return lost of required components
    list(predict = prd, model = glmf, coefficients = cfs)
}

## No test: 
subgrp.model.bin.cust <- fit.subgroup(x = x, y = y.binary,
                                 trt = trt01,
                                 propensity.func = prop.func,
                                 fit.custom.loss = fit.custom.loss.bin)

subgrp.model.bin.cust
## End(No test)


## try exponential loss for
## positive outcomes

fit.expo.loss <- function(x, y, weights, ...)
{
    expo.loss <- function(beta, x, y, weights) {
        sum(weights * y * exp(-drop(x %*% beta)))
    }

    # use optim() to minimize loss function
    opt <- optim(rep(0, NCOL(x)), fn = expo.loss, x = x, y = y, weights = weights)

    coefs <- opt$par

    pred <- function(x, type = "response") {
        tcrossprod(cbind(1, x), t(coefs))
    }

    # return list of required components
    list(predict = pred, model = opt, coefficients = coefs)
}

## No test: 
# use exponential loss for positive outcomes
subgrp.model.expo <- fit.subgroup(x = x, y = y.count,
                                  trt = trt01,
                                  propensity.func = prop.func,
                                  fit.custom.loss = fit.expo.loss)

subgrp.model.expo
## End(No test)





