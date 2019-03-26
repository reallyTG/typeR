## ----initialization, eval = FALSE----------------------------------------
#  ## Install packages
#  install.packages(c("betareg"))       ## install betareg for comparison of results

## ----load_package, message=FALSE, warning=FALSE--------------------------
library("betaboost")                 ## load betaboost

## ----load_data-----------------------------------------------------------
## load data
# data("dataqol2", package = "QoLR")
data(dataqol2)
## take one time-point
dataqol <- dataqol2[dataqol2$time ==0,]
## remove missings
dataqol <- dataqol[complete.cases(dataqol[,c("QoL", "arm", "pain")]),]
## rescale outcome to [0,1]
dataqol$QoL <- dataqol$QoL/100

## ------------------------------------------------------------------------
str(dataqol)

## ----outcome-------------------------------------------------------------
hist(dataqol$QoL, breaks = 20, col = "lightgrey", 
     main = "Quality of life", prob = TRUE, las = 1)
lines(density(dataqol$QoL), col = 2, lwd = 2)

## ------------------------------------------------------------------------
## QOL by treatment arm
boxplot(QoL ~ arm, data = dataqol, names = c("A","B"), las = 1,
        col = "lightgrey", ylab = "Qualitiy of life")

## ------------------------------------------------------------------------
## QOL by pain
plot(QoL ~ pain, data = dataqol, pch = 19, las = 1)
abline(lm(QoL ~ pain, data = dataqol))

## ------------------------------------------------------------------------
beta1 <- betaboost(QoL ~ pain + arm, data = dataqol)
coef(beta1, off2int = TRUE)

## ------------------------------------------------------------------------
nuisance(beta1)

## ------------------------------------------------------------------------
beta2 <- betaboost(QoL ~ s(pain) + arm, data = dataqol, 
                   form.type = "classic")

## ------------------------------------------------------------------------
plot(beta2, which = "pain")

## ------------------------------------------------------------------------
set.seed(1234)
cvr <- cvrisk(beta2)
## extract optimal boosting iteration as determined via cvrisk
mstop(cvr)
## and plot the predictive risk (on out-of-bag observations) over the iterations
plot(cvr)

## ------------------------------------------------------------------------
## set model to optimal stopping iteration:
mstop(beta2) <- mstop(cvr)

## ------------------------------------------------------------------------
coef(beta2)

## ------------------------------------------------------------------------
beta3 <- betaboost(QoL ~ arm + pain, 
                   phi.formula = QoL ~ arm + pain, 
                   data = dataqol)
coef(beta3, off2int = TRUE)

## ------------------------------------------------------------------------
beta4 <- betaboost(QoL ~ arm + s(pain), 
                   phi.formula = QoL ~ arm + s(pain),
                   data = dataqol, form.type = "classic")
par(mfrow = c(1,2))
plot(beta4, which =  "pain")

## ------------------------------------------------------------------------
# fitted values
preds <- predict(beta4, type = "response")
summary(cbind(preds$mu, preds$phi))

## ------------------------------------------------------------------------
# predictions for two new obs from the two treatment arms
predict(beta3, newdata = data.frame(pain = c(30, 30), arm = c(0,1)), 
                 type = "response")

## ------------------------------------------------------------------------
cbind("lin" = R2.betaboost(beta1, data = dataqol), 
      "smooth" = R2.betaboost(beta2[100], data = dataqol),
      "ext. lin" = R2.betaboost(beta3, data = dataqol),
      "ext. smooth" = R2.betaboost(beta4, data = dataqol))

## ----init, warning=FALSE, message=FALSE----------------------------------
## load betareg and data
library(betareg)
data(FoodExpenditure)

## ------------------------------------------------------------------------
beta1 <- betareg(I(food/income) ~ income + persons, 
                 data = FoodExpenditure)

## ------------------------------------------------------------------------
beta2 <- betaboost(I(food/income) ~ income + persons, 
                   data = FoodExpenditure)

## ------------------------------------------------------------------------
rbind("betareg" = coef(beta1), 
      "betaboost" = c(coef(beta2, off2int = TRUE), 
                      nuisance(beta2)))

## ------------------------------------------------------------------------
mstop(beta2) <- 500
## compare again
rbind("betareg" = coef(beta1), 
      "betaboost" = c(coef(beta2, off2int = TRUE), 
                      nuisance(beta2)))

## ------------------------------------------------------------------------
plot(beta2, off2int = TRUE, main = "boosting")

## ------------------------------------------------------------------------
## Fit same model than beta2 but via matrix interface
beta2b <- betaboost(y = FoodExpenditure$food/FoodExpenditure$income, 
                    x = cbind(FoodExpenditure$income, FoodExpenditure$persons),
                    iterations = 500)
coef(beta2b)

## ------------------------------------------------------------------------
## Now extended beta regression
beta2c <- betaboost(y = FoodExpenditure$food/FoodExpenditure$income, 
                    x = cbind(income = FoodExpenditure$income, persons = FoodExpenditure$persons),
                    iterations = 500, mat.parameter = "both", 
                    mat.effect = "linear")
coef(beta2c)

