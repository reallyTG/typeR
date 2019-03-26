library(funreg)


### Name: funreg
### Title: Perform penalized functional regression
### Aliases: funreg

### ** Examples

simple.model <- funreg(id=SampleFunregData$id,
                       response=SampleFunregData$y,
                       time=SampleFunregData$time,
                       x=SampleFunregData$x1,
                       family=binomial);
print(simple.model);
par(mfrow=c(2,2));
plot(x=simple.model$model.for.x[[1]]$bin.midpoints,
     y=simple.model$model.for.x[[1]]$mu.x.by.bin,
     xlab="Time t",ylab="X(t)",main="Smoothed mean x values");
# The smoothed average value of the predictor function x(t) at different times t.
# The ``[[1]]'' after model.for.x is there because model.for.x is a list with one entry.
# This is because more than one functional covariate is allowed.
plot(simple.model,type="correlations");
# The marginal correlation of x(t) with y at different times t.
# It appears that earlier time points are more strongly related to y.
plot(simple.model,type="coefficients");
# The functional regression coefficient of y on x(t).
# It also appears that earlier time points are more strongly related to y.
plot(simple.model$subject.info$response,
     simple.model$subject.info$fitted,
     main="Predictive Performance",
     xlab="True Y",
     ylab="Fitted Y");



