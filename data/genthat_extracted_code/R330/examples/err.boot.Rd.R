library(R330)


### Name: err.boot
### Title: Calculates a bootstrap estimate of prediction error
### Aliases: err.boot err.boot.lm err.boot.glm err.boot.formula
### Keywords: attribute

### ** Examples

data(drug.df)
err.boot(DFREE ~ NDRUGTX + factor(IVHX) + AGE + TREAT, data= drug.df)



