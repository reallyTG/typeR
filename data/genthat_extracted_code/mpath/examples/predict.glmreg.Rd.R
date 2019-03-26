library(mpath)


### Name: predict.glmreg
### Title: Model predictions based on a fitted "glmreg" object.
### Aliases: predict.glmreg coef.glmreg
### Keywords: models regression

### ** Examples

## Dobson (1990) Page 93: Randomized Controlled Trial :
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
print(d.AD <- data.frame(treatment, outcome, counts))
fit <- glmreg(counts ~ outcome + treatment, data=d.AD, family="poisson")
predict(fit, newx=d.AD[,1:2])
summary(fit)
coef(fit)



