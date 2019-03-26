library(R330)


### Name: ROC.curve
### Title: draws an ROC curve
### Aliases: ROC.curve ROC.curve.glm ROC.curve.formula
### Keywords: aplot

### ** Examples

data(drug.df)
ROC.curve(DFREE ~ NDRUGTX + factor(IVHX) + AGE + TREAT, family=binomial,
     data= drug.df)



