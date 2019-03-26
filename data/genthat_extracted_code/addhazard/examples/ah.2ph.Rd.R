library(addhazard)


### Name: ah.2ph
### Title: Fit Additive Hazards Regression Models to Two-phase Sampling
### Aliases: ah.2ph

### ** Examples

library(survival)
### fit an additive hazards model to two-phase sampling data without calibration
nwts2ph$trel <- nwts2ph$trel + runif(dim(nwts2ph)[1],0,1)*1e-8
fit1 <- ah.2ph(Surv(trel,relaps) ~ age + histol, ties = FALSE, data = nwts2ph, R = in.ph2, Pi = Pi,
 robust = FALSE,  calibration.variables = NULL)
summary(fit1)

### fit an additve hazards model with calibration on age
fit2 <- ah.2ph(Surv(trel,relaps) ~ age + histol, ties = FALSE, data = nwts2ph, R = in.ph2, Pi = Pi,
 robust = FALSE, calibration.variables = "age")
summary(fit2)

### calibrate on age square
### note if users create a  calibration variable, then
### the new variable should be added to the original data frame
nwts2ph$age2 <- nwts2ph$age^2
fit3 <- ah.2ph(Surv(trel,relaps) ~ age + histol, ties = FALSE, data = nwts2ph, R = in.ph2, Pi = Pi,
                                   robust = FALSE, calibration.variables = "age2")
summary(fit3)

#############################################################################
### When phase II samples are obtained by finite Sampling       #############
#############################################################################

### calculating the sample size for each straum
### calculate the strata size
strt.size <- table(nwts2ph$strt)
ph2.strt.size <- table(subset(nwts2ph, in.ph2 == 1)$strt)
### fit an additve hazards model with finite stratified sampling
### calculate the sampling fractions
frac <- ph2.strt.size/strt.size
### treating the problem as bernoulli sampling coupled with calibration on strata sizes
### using frac as the sampling probilities
nwts2ph_by_FPSS <- nwts2ph
nwts2ph_by_FPSS$Pi <- NULL
for (i in 1:length(strt.size)){
  nwts2ph_by_FPSS$Pi[nwts2ph_by_FPSS$strt ==i] <- frac[i]
}

### create strt indicators, which become our calibration variables
for (i in 1:length(strt.size)){
   nwts2ph_by_FPSS$strt_ind <- as.numeric(nwts2ph_by_FPSS$strt ==i)
   names(nwts2ph_by_FPSS)[ncol(nwts2ph_by_FPSS)]= paste0("strt", i)
}
### fit an additve hazards model with finate sampling
fit4 <- ah.2ph(Surv(trel,relaps) ~ age + histol,
                                   data = nwts2ph_by_FPSS, ties = FALSE,
                                   R = in.ph2, Pi = Pi,
                                   robust = FALSE,
                                   calibration.variables = c("strt1","strt2","strt3"))
summary(fit4)



