library(ACSWR)


### Name: lowbwt
### Title: The Low-Birth Weight Problem
### Aliases: lowbwt
### Keywords: logistic regression, model selection

### ** Examples

data(lowbwt)
lowglm <- glm(LOW~AGE+LWT+RACE+FTV,data=lowbwt,family='binomial') 
lowglm$coefficients



