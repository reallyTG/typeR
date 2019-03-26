library(rld)


### Name: calcpk
### Title: Calculate Per-Challenge Probability of Infection
### Aliases: calcpk print.calcpk summary.calcpk print.summary.calcpk
### Keywords: per-challenge probability of infection

### ** Examples

data(SampleData)
newdata <- transdata(data = SampleData, ndlevel = 3, nexposure = c(10, 10, 2))
fitout <- rld(formula = survival::Surv(time, delta)~factor(dose)+trt+I(I(dose==3)*trt),
              data = newdata, frailty = TRUE)

predictdata <- 1
names(predictdata) <- c("trt")

pkout <- calcpk(object = fitout, predlevel = predictdata, CIlevel = 0.95)
summary(pkout)



