library(drc)


### Name: S.alba
### Title: Potency of two herbicides
### Aliases: S.alba
### Keywords: datasets

### ** Examples


## Fitting a log-logistic model with
##  common lower and upper limits
S.alba.LL.4.1 <- drm(DryMatter~Dose, Herbicide, data=S.alba, fct = LL.4(),
pmodels=data.frame(Herbicide,1,1,Herbicide)) 
summary(S.alba.LL.4.1)

## Applying the optimal transform-both-sides Box-Cox transformation
## (using the initial model fit)  
S.alba.LL.4.2 <- boxcox(S.alba.LL.4.1, method = "anova") 
summary(S.alba.LL.4.2)

## Plotting fitted regression curves together with the data
plot(S.alba.LL.4.2)




