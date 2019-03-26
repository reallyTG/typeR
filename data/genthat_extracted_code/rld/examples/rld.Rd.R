library(rld)


### Name: rld
### Title: Fit a Discrete-Time Survival Model
### Aliases: rld print.rld summary.rld print.summary.rld
### Keywords: rld Discrete-time survival model

### ** Examples

data(SampleData)
newdata <- transdata(data = SampleData, ndlevel = 3, nexposure = c(10, 10, 2))

#interaction between the hightest dose level and treatment assignment
#under the discrete-time survival model with random effects

fitout1 <- rld(formula = survival::Surv(time, delta)~factor(dose)+trt+I(I(dose==3)*trt),
              data = newdata, frailty = TRUE)
#summary(fitout1)

## Not run: 
##D #main effects model without random effectss
##D ini <- rep(0.5, 4)
##D lwr <- rep(-Inf, 4)
##D upr <- rep(Inf, 4)
##D 
##D fitout2 <- rld(formula = survival::Surv(time, delta)~factor(dose)+trt,
##D                initial = ini, lower = lwr, upper = upr, data = newdata,
##D                frailty = FALSE)
##D #summary(fitout2)
## End(Not run)



