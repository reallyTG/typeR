library(SurvDisc)


### Name: simexlme
### Title: SIMEX algorithm for linear mixed effects models
### Aliases: simexlme

### ** Examples

set.seed(1234)
data("simGFRdata")
simGFR=simGFR[is.element(simGFR$time,c(1:12)/4) & is.element(simGFR$PID,c(1:80)*100),]

fm2=nlme::lme.formula(fixed = cfb ~ time + x1:time + trt + trt:time + trt:x1:time + 0,
                data = simGFR, random = ~time | PID,
                correlation = nlme::corCompSymm(0.5,form = ~time | PID, fixed = TRUE),
                control=nlme::lmeControl(returnObject=TRUE))

(s1 = simexlme(model=fm2, model.model=simGFR[,c("cfb","PID","time","x1","trt")],
                SIMEXvariable="x1",respvar="cfb",grpvar="PID",corform="~time | PID",
                measurement.error=res.sd,measurement.error.resp=res.sd,
                lambda = c(0.5,2),B = 2, fitting.method = "linear",
                jackknife.estimation = FALSE))

plot(s1)

#values of fixed effects used to simulate data
c(fixed.time,fixed.trt,fixed.leGFR,fixed.trttime,fixed.leGFRtrt)

#naive estimates
fm2$coefficients$fixed

#SIMEX corrected estimates
s1$coefficients



