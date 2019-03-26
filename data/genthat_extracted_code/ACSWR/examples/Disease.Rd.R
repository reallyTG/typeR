library(ACSWR)


### Name: Disease
### Title: Disease Outbreak Study
### Aliases: Disease
### Keywords: residual analysis, logistic regression

### ** Examples

data(Disease)
DO_LR <- glm(y~.,data=Disease,family='binomial')
LR_Residuals <- data.frame(Y = Disease$y,Fitted = fitted(DO_LR),
Hatvalues = hatvalues(DO_LR),Response = residuals(DO_LR,"response"), Deviance = 
residuals(DO_LR,"deviance"), Pearson = residuals(DO_LR,"pearson"), 
Pearson_Standardized = residuals(DO_LR,"pearson")/sqrt(1-hatvalues(DO_LR)))
LR_Residuals



