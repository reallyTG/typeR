library(BayesFactor)


### Name: linearReg.R2stat
### Title: Use R^2 statistic to compute Bayes factor for regression designs
### Aliases: linearReg.R2stat
### Keywords: htest

### ** Examples

## Use attitude data set
data(attitude)
## Scatterplot
lm1 = lm(rating~complaints,data=attitude)
plot(attitude$complaints,attitude$rating)
abline(lm1)
## Traditional analysis
## p value is highly significant
summary(lm1)

## Bayes factor
## The Bayes factor is over 400,000;
## the data strongly favor hypothesis that
## the slope is not 0.
result = linearReg.R2stat(30,1,0.6813)
exp(result[['bf']])



