library(pubh)


### Name: pseudo_r2
### Title: Pseudo R2 (logistic regression) 'pseudo_r2' Calculates R2
###   analogues (pseudo R2) of logistic regression.
### Aliases: pseudo_r2

### ** Examples

model_oncho <- glm(mf ~ area, data = Oncho, binomial)
glm_coef(model_oncho, labels = c("Constant", "Area (rainforest/savannah)"))
pseudo_r2(model_oncho)



