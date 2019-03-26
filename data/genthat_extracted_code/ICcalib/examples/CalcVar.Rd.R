library(ICcalib)


### Name: CalcVarParam
### Title: Variance estimation for the main proportional hazards model
### Aliases: CalcVarParam CalcVarParamRSInts CalcVarThetaWeib
###   CalcVarThetaWeibRS CalcVarNpmle CalcVarNpmleRS

### ** Examples

# Simulate data set
sim.data <- ICcalib:::SimCoxIntervalCensSingle(n.sample = 200, lambda = 0.1, alpha = 0.25, 
                                               beta0 = log(0.5), mu = 0.2, n.points = 2, 
                                               weib.shape = 1, weib.scale = 2)
case.times <- sim.data$obs.tm[sim.data$delta==1]
# Fit a Weibull calibration model for the covariate starting time distribution
calib.weib.params <- FitCalibWeibull(w = sim.data$w, w.res = sim.data$w.res)
px <- t(sapply(case.times, CalcWeibullCalibP, w = sim.data$w, 
               w.res =  sim.data$w.res, weib.params = calib.weib.params))
# Calculate derivative matrices
px.deriv.shape <- t(sapply(case.times, ICcalib:::CalcWeibullCalibPderivShape, 
w = sim.data$w, w.res =  sim.data$w.res, weib.params = calib.weib.params))
px.deriv.scale <- t(sapply(case.times, ICcalib:::CalcWeibullCalibPderivScale, 
w = sim.data$w, w.res = sim.data$ w.res, weib.params = calib.weib.params))
# Point estimate 
est.weib.calib <- optimize(f = ICcalib:::CoxLogLikX,  tm = sim.data$obs.tm, 
                           event = sim.data$delta, ps = px, interval = c(-50,50), 
                           maximum = TRUE)$maximum
# Variance estimate (no addtional covariates)
var.beta.wb <- CalcVarThetaWeib(beta = est.weib.calib, etas = calib.weib.params, 
                                tm = sim.data$obs.tm, event = sim.data$delta, 
                                ps = px, ps.deriv.shape = px.deriv.shape, 
                                ps.deriv.scale =  px.deriv.scale, w = sim.data$w, 
                                w.res = sim.data$w.res)
 print(est.weib.calib)
 print(var.beta.wb)                               



