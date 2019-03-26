library(addhazard)


### Name: predict.ah.2ph
### Title: Prediction Based on the Additive Hazards Model Fitted from
###   Two-phase Sampling
### Aliases: predict.ah.2ph

### ** Examples

library(survival)
### load data
nwts <- nwtsco[1:100,]

### create strata based on  institutional histology and disease status
nwts$strt <- 1+nwts$instit
### add a stratum containing all (relapsed) cases
nwts$strt[nwts$relaps==1] <- 3

### assign phase II subsampling probabilities
### oversample unfavorable histology (instit =1) and cases
### Pi = 0.5 for instit =0, Pi =1 for instit =1 and relaps =1
nwts$Pi<-  0.5 * (nwts$strt == 1) + 1 * (nwts$strt == 2) + 1 * (nwts$strt == 3)

### generate phase II sampling indicators
N <- dim(nwts)[1]
nwts$in.ph2 <-  rbinom(N, 1, nwts$Pi)

### fit an additive hazards model to  two-phase sampling data without calibration
fit1 <- ah.2ph(Surv(trel,relaps) ~ age + histol,
               data = nwts,
               ties = FALSE,
               R = in.ph2, Pi = Pi,
               robust = FALSE)

###  input the new data for prediction
newdata <- nwtsco[101,]
###  based on the fitted model fit1, perform prediction at time points t =3 and t= 5
predict(fit1, newdata, newtime = c(3,5))

### fit an additve hazards model to  two-phase sampling data with calibration
### The calibration variable is stage
fit2 <- ah.2ph(Surv(trel,relaps) ~ age + histol, data = nwts, R = in.ph2, Pi = Pi,
                                   ties = FALSE, robust = FALSE, calibration.variables = "stage")

### based on the fitted model fit2, perform prediction at time points t =3 and t= 5
predict(fit2, newdata, newtime = c(3,5))

## Not run: 
##D ### The calibration variable is stage, when set robust = TRUE
##D fit3 <- ah.2ph(Surv(trel,relaps) ~ age + histol, data = nwts, R = in.ph2, Pi = Pi,
##D                                    ties = FALSE, robust = TRUE, calibration.variables = "stage")
##D 
##D ### based on the fitted model fit2, perform prediction at time points t =3 and t= 5
##D predict(fit3, newdata, newtime = c(3,5))
## End(Not run)



