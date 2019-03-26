library(fcr)


### Name: fcr
### Title: Fit Functional Concurrent Regression
### Aliases: fcr

### ** Examples


## Don't show: 
## toy example, use small number of interior knots for fpca/small number of
## eigenfunctions to speed up computation time. See example below for a more realistic analysis.
data <- content[1:1000,]
k <- 4
K <- 3
fit <- fcr(formula = Y ~ s(argvals, k = K) + Male,
           argvals = "argvals", subj = "subj", data = data, use_bam=TRUE,
           nPhi = 1,
           face.arges = list(knots = k))
## End(Don't show)


## No test: 

data <- content
## smoothing parameters
k <- 12  # number of interior knots for fpca (results in k + 3 basis functions)
K <- 15 # dimenson of smooth for time varying coefficients

## functional domain where we need predictions
tnew <- sort(unique(data$argvals))

###########################################
## Step 1: Smooth time-varying covariate ##
###########################################
dat.waz <- data.frame("y" = data$waz, "subj" = data$subj, argvals = data$argvals)
fit.waz <- face.sparse(dat.waz, newdata = dat.waz, knots = k, argvals.new = tnew)
data$wazPred <- fit.waz$y.pred


#####################
## Step 2: Fit fcr ##
#####################
fit <- fcr(formula = Y ~ s(argvals, k=K, bs="ps") +
                         s(argvals, by=Male, k=K, bs="ps") +
                         s(argvals, by=wazPred, bs="ps"),
           argvals = "argvals", subj="subj", data=data, use_bam=TRUE, argvals.new=tnew,
           face.args = list(knots=k, pve=0.99))

## plot covariance features
plot(fit, plot.covariance=TRUE)

## plot coefficient functions and qq plots for random effects
plot(fit)

########################
## Step 3: Prediction ##
########################
## data frames for in-sample and dynamic predictions
data_dyn <- data_in <- data

## change subject IDs to values not used in model fitting
## for dynamic prediction
data_dyn$subj <- data_dyn$subj + 1000

## make all observations beyond 0.5 NA in both data frames
## and dynamically predict the concurrent covariate in
## dynamic prediction
inx_na <- which(data_dyn$argvals > 0.5)
data_dyn$Y[inx_na] <- data_dyn$waz[inx_na] <- NA
data_dyn$wazPred <- predict(fit.waz,
                            newdata= data.frame("subj" = data_dyn$subj,
                                                "argvals" = data_dyn$argvals,
                                                "y" = data_dyn$Y))$y.pred

data_in$Y[inx_na]  <- NA


## in sample and dynamic predictions on the same subjects
insample_preds  <- predict(fit, newdata = data)
dynamic_preds   <- predict(fit, newdata = data_dyn)

## End(No test)




