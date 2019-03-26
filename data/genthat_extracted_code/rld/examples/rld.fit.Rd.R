library(rld)


### Name: rld.fit
### Title: Discrete-Time Survival Model Fitting Function
### Aliases: rld.fit
### Keywords: fitting function

### ** Examples

data(SampleData)
newdata <- transdata(data = SampleData, ndlevel = 3, nexposure = c(10, 10, 2))
formulaexp <- survival::Surv(time, delta)~factor(dose)+trt+I(I(dose==3)*trt)
designmat <- model.matrix(formulaexp, data = newdata)
time <- SampleData$time
status <- SampleData$delta
inival <- rep(0.5, 6)
lwrval <- c(rep(-Inf, 5), 0.01)
uprval <- rep(Inf, 6)
frailty <- TRUE

rld.fit(X = designmat, C = time, delta = status, initial = inival,
        lower = lwrval, upper = uprval, frailty = frailty)



