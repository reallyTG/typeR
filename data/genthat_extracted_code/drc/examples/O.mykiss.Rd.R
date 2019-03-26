library(drc)


### Name: O.mykiss
### Title: Test data from a 21 day fish test
### Aliases: O.mykiss
### Keywords: datasets

### ** Examples


head(O.mykiss)

## Fitting exponential model
O.mykiss.m1 <- drm(weight ~ conc, data = O.mykiss, fct = EXD.2(), na.action = na.omit)
modelFit(O.mykiss.m1)
summary(O.mykiss.m1)

## Fitting same model with transform-both-sides approach
O.mykiss.m2 <- boxcox(O.mykiss.m1 , method = "anova")
summary(O.mykiss.m2)
# no need for a transformation

## Plotting the fit
plot(O.mykiss.m1, type = "all", xlim = c(0, 500), ylim = c(0,4),
xlab = "Concentration (mg/l)", ylab = "Weight (g)", broken = TRUE)




