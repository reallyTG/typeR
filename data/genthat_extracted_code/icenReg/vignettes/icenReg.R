### R code from vignette source 'icenReg.Rnw'

###################################################
### code chunk number 1: icenReg.Rnw:37-39
###################################################
# For consistency of poor mixing in Bayes example
set.seed(123)


###################################################
### code chunk number 2: icenReg.Rnw:168-169
###################################################
library(icenReg)


###################################################
### code chunk number 3: icenReg.Rnw:172-174
###################################################
data(miceData)
head(miceData, 3)


###################################################
### code chunk number 4: icenReg.Rnw:179-180
###################################################
np_fit = ic_np(cbind(l, u) ~ grp, data = miceData)


###################################################
### code chunk number 5: icenReg.Rnw:185-187
###################################################
groupedFit1 <- ic_np(cbind(l,u) ~ 0, data = miceData)
groupedFit2 <- ic_np(miceData[,c('l', 'u')])


###################################################
### code chunk number 6: icenReg.Rnw:192-194
###################################################
plot(np_fit, col = c('blue', 'orange'),
     xlab = 'Time', ylab = 'Estimated Survival')


###################################################
### code chunk number 7: icenReg.Rnw:206-208
###################################################
data("IR_diabetes")
head(IR_diabetes, 3)


###################################################
### code chunk number 8: icenReg.Rnw:213-218
###################################################
  fit_ph <- ic_sp(cbind(left, right) ~ gender, model = 'ph', 
                  bs_samples = 100, data = IR_diabetes)
      
  fit_po <- ic_sp(cbind(left, right) ~ gender, model = 'po',
                  bs_samples = 100, data = IR_diabetes)


###################################################
### code chunk number 9: icenReg.Rnw:223-225
###################################################
  fit_po
  fit_ph


###################################################
### code chunk number 10: icenReg.Rnw:234-239
###################################################
  newdata <- data.frame(gender = c('male', 'female') )
    
  rownames(newdata) <- c('males', 'females')

  plot(fit_po, newdata)


###################################################
### code chunk number 11: icenReg.Rnw:250-252
###################################################
fit_po_gamma <- ic_par(cbind(left, right) ~ gender,
    data = IR_diabetes, model = "po", dist = "gamma")


###################################################
### code chunk number 12: icenReg.Rnw:258-259
###################################################
fit_po_gamma


###################################################
### code chunk number 13: icenReg.Rnw:264-265
###################################################
plot(fit_po_gamma, newdata, lgdLocation = "topright")


###################################################
### code chunk number 14: icenReg.Rnw:272-274
###################################################
flatPrior_fit <- ic_bayes(cbind(left, right) ~ gender,
    data = IR_diabetes, model = "po", dist = "gamma")


###################################################
### code chunk number 15: icenReg.Rnw:279-280
###################################################
flatPrior_fit


###################################################
### code chunk number 16: icenReg.Rnw:286-287
###################################################
head(flatPrior_fit$samples)  


###################################################
### code chunk number 17: icenReg.Rnw:295-299
###################################################
# Accessing the first few samples of the first chain
head(flatPrior_fit$mcmcList[[1]])
# Accessing the first few samples of the second chain
head(flatPrior_fit$mcmcList[[2]])


###################################################
### code chunk number 18: icenReg.Rnw:304-305
###################################################
head(flatPrior_fit$logPosteriorDensities[[1]])  


###################################################
### code chunk number 19: icenReg.Rnw:311-313
###################################################
  plot(flatPrior_fit, newdata,
       main = 'Posterior Median Estimates')


###################################################
### code chunk number 20: icenReg.Rnw:319-320
###################################################
  plot(flatPrior_fit$mcmcList)


###################################################
### code chunk number 21: icenReg.Rnw:327-344
###################################################
 logPriorFunction <- function(x){
   ans <- 0 
   ans <- ans + dnorm(x[1], sd = 0.1, log = T)
   # Tight prior about 1st parameter, log_shape
   ans <- ans + dnorm(x[2], sd = 10, log = T)
   # Diffuse prior about 2nd parameter, log_scale
   ans <- ans + dnorm(x[3], sd = 0.1, log = T)
   # Tight prior about 3rd parameter, regression parameter
   return(ans)
 }    
  
informPrior_fit <- ic_bayes(cbind(left, right) ~ gender,
    data = IR_diabetes, model = "po", dist = "gamma",
    logPriorFxn = logPriorFunction)
# Fitting model with prior. 

informPrior_fit


###################################################
### code chunk number 22: icenReg.Rnw:351-359
###################################################
weak_data <- IR_diabetes[1:2,]
weakData_fit <- ic_bayes(cbind(left, right) ~ gender,
    data = weak_data,
    model = "po", dist = "gamma",
    logPriorFxn = logPriorFunction,
    controls = bayesControls(useMLE_start = F))

plot(weakData_fit$mcmcList)


###################################################
### code chunk number 23: icenReg.Rnw:369-378
###################################################
# Extract estimates for inverse CDF
invCDF_ests = survCIs(informPrior_fit, newdata, 
                      p = seq(from = 0.05, to = .95, by = 0.2))
# Extract estimates for *CDF* probabilities at given values
CDF_ests = survCIs(informPrior_fit, newdata, 
                   q = seq(from = 5, to = 25, by = 5))

invCDF_ests
CDF_ests


###################################################
### code chunk number 24: icenReg.Rnw:400-406
###################################################
diag_baseline(cbind(left, right) ~ gender,
    model = "po",
    data = IR_diabetes,
    dists = c("exponential", "weibull", 
              "loglogistic", "gamma"),
    lgdLocation = "topright")


###################################################
### code chunk number 25: icenReg.Rnw:411-415
###################################################
diag_baseline(fit_po, lgdLocation = "topright",
              dists = c("exponential", "weibull", 
                        "loglogistic", "gamma")
              )


###################################################
### code chunk number 26: icenReg.Rnw:434-438
###################################################
diag_covar(fit_po, lgdLocation = "topright", 
           main = "Checking Proportional Odds")
diag_covar(fit_ph, lgdLocation = "topright", 
           main = "Checking Proportional Hazards")


###################################################
### code chunk number 27: icenReg.Rnw:448-451
###################################################
diag_covar(fit_po, lgdLocation = "topright", 
           main = "Checking Proportional Odds")



###################################################
### code chunk number 28: icenReg.Rnw:453-455
###################################################
diag_covar(fit_ph, lgdLocation = "topright", 
           main = "Checking Proportional Hazards")


