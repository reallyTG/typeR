library(mma)


### Name: form.interaction
### Title: Create interaction terms of predictor(s) and potential
###   moderator(s).
### Aliases: form.interaction

### ** Examples

data("weight_behavior")
pred=weight_behavior[,3]
x=weight_behavior[,c(2,4:14)]
x=form.interaction(x,pred,inter.cov=c("sports","sweat"),predref=NULL) 
head(x)



