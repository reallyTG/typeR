library(rld)


### Name: lrtest
### Title: Likelihood Ratio Test
### Aliases: lrtest print.lrtest
### Keywords: LRT

### ** Examples

#test frailty variance parameter
data(SampleData)
newdata <- transdata(data = SampleData, ndlevel = 3, nexposure = c(10, 10, 2))
fitout1 <- rld(formula = survival::Surv(time, delta)~factor(trt)+factor(dose), data = newdata,
               frailty = FALSE)
fitout2 <- rld(formula = survival::Surv(time, delta)~factor(trt)+factor(dose), data = newdata,
               frailty = TRUE)
testnu <- lrtest(model1 = fitout1, model2 = fitout2, TestNu=TRUE)

## Not run: 
##D #test regression parameters
##D fitout3 <- rld(formula = survival::Surv(time, delta)~factor(dose), data = newdata,
##D                frailty = TRUE)
##D fitout4 <- rld(formula = survival::Surv(time, delta)~factor(trt)+factor(dose), data = newdata,
##D                frailty = TRUE)
##D testbeta <- lrtest(model1 = fitout3, model2 = fitout4, TestNu=FALSE)
## End(Not run)



