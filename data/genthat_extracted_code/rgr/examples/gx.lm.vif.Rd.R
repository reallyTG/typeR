library(rgr)


### Name: gx.lm.vif
### Title: Estimate Variance Inflation Factosr (VIFs)
### Aliases: gx.lm.vif
### Keywords: models

### ** Examples

## Make test data available
data(sind)
attach(sind)

## Model 1
sind.1 <- lm(log(Zn) ~ Fe + log(Mn) + log(Cu) + log(Cd))
summary(sind.1)
gx.lm.vif(sind.1)

## Model 2
sind.2 <- lm(log(Zn) ~ Fe + log(Mn))
summary(sind.2)
gx.lm.vif(sind.2)
AIC(sind.1, sind.2)

## Model 3
sind.3 <- lm(log(Zn) ~ log(Mn) + log(Cu))
summary(sind.3)
gx.lm.vif(sind.3)
AIC(sind.1, sind.2, sind.3) 

## Clean-up and detach test data
rm(sind.1)
rm(sind.2)
rm(sind.3)
detach(sind) 



