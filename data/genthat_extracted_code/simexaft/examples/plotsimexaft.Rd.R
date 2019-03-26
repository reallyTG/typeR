library(simexaft)


### Name: plotsimexaft
### Title: Plot the Extrapolation Curve
### Aliases: plotsimexaft

### ** Examples

###########example for the dataset with known variance.################
library("simexaft")
library("survival")
data("BHS")
dataset <- BHS
dataset$SBP <- log(dataset$SBP-50)

set.seed(120)
formula <- Surv(SURVTIME,DTHCENS)~SBP+CHOL+AGE+BMI+SMOKE1+SMOKE2

ind <- c("SBP", "CHOL")
err.mat <- diag(rep(0.5625, 2))

### fit an AFT model with quadratic extrapolation
out2 <- simexaft(formula = formula, data = dataset, SIMEXvariable = ind, 
        repeated = FALSE, repind = list(), err.mat = err.mat, B = 50, 
        lambda=seq(0, 2, 0.1),extrapolation="quadratic", dist="weibull")

summary(out2)

plotsimexaft(out2,"SBP","both",ylimit=c(-3,1))




