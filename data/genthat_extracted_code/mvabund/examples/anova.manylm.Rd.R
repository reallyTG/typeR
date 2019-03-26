library(mvabund)


### Name: anova.manylm
### Title: ANOVA for Linear Model Fits for Multivariate Abundance Data
### Aliases: anova.manylm print.anova.manylm
### Keywords: regression models multivariate

### ** Examples

## Load the spider dataset:
data(spider)
spiddat <- log(spider$abund+1)
spiddat <- mvabund(spiddat)
spidx <- spider$x

## Fit several multivariate linear models:
fit <- manylm( spiddat ~ spidx ) # model with all explanatory variables

## Use the default residual resampling to test the significance of this model:
## return summary of the manylm model
anova(fit)

## intercept model
fit0 <- manylm(spiddat ~ 1)
## include soil and leaf variables
fit1 <- update(fit0, . ~ . + spidx[, c(1, 3)])
## include moss variables
fit2 <- update(fit1, . ~ . + spidx[, 4]) 

## Use (residual) resampling to test the significance of these models, 
## accounting for correlation between variables by shrinking 
## the correlation matrix to improve its stability:
anova(fit, fit0, fit1, fit2, cor.type="shrink")

## Use the sum of F statistics to estimate multivariate significance from 
## 4999 resamples, and also reporting univariate statistics with 
## adjusted P-values:
anova(fit, fit0, fit1, fit2, nBoot=4999, test="F", p.uni="adjust")




