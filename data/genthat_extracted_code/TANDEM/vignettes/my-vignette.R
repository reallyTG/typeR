## ---- fig.show='hold', warning=F, message=F------------------------------
library(TANDEM)
library(glmnet)
x = example_data$x
y = example_data$y
upstream = example_data$upstream
data_types = example_data$data_types

## ---- fig.show='hold'----------------------------------------------------
# fit a tandem model, determine the coefficients and create a prediction
fit = tandem(x, y, upstream, alpha=0.5)
beta = coef(fit)
y_hat = predict(fit, newx=x)

## ---- fig.show='hold'----------------------------------------------------
# fix the cv folds, to facilitate a comparison between models
set.seed(1)
n = nrow(x)
nfolds = 10
foldid = ceiling(sample(1:n)/n * nfolds)

fit = tandem(x, y, upstream, alpha=0.5, foldid=foldid)
fit2 = cv.glmnet(x, y, alpha=0.5, foldid=foldid)

## ---- fig.show='hold'----------------------------------------------------
# assess the relative contribution of upstream and downstream features
# using both methods
contr_tandem = relative.contributions(fit, x, data_types)
contr_glmnet = relative.contributions(fit2, x, data_types)
par(mar=c(6,4,4,4))
barplot(contr_tandem, ylab="Relative contribution", main="TANDEM", ylim=0:1, las=2)
barplot(contr_glmnet, ylab="Relative contribution", main="Classic approach", ylim=0:1, las=2)

## ---- fig.show='hold'----------------------------------------------------
# assess the prediction error in a nested cv-loop
# fix the seed to have the same foldids between the two methods
set.seed(1)
cv_tandem = nested.cv(x, y, upstream, method="tandem", alpha=0.5)
set.seed(1)
cv_glmnet = nested.cv(x, y, upstream, method="glmnet", alpha=0.5)
par(mar=c(8,4,1,1))
barplot(c(cv_tandem$mse, cv_glmnet$mse), ylab="MSE", names=c("TANDEM", "Classic approach"), las=2)

