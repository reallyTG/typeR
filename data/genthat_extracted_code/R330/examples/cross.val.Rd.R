library(R330)


### Name: cross.val
### Title: Calculates cross-validated estimates of prediction error
### Aliases: cross.val cross.val.lm cross.val.glm cross.val.formula
### Keywords: attribute

### ** Examples

data(fatty.df)
fatty.lm <- lm(ffa~age+weight+skinfold, data=fatty.df)
cross.val(fatty.lm)
#
data(drug.df)
cross.val(DFREE ~ NDRUGTX + factor(IVHX) + AGE + TREAT, family=binomial,
     data=drug.df)



