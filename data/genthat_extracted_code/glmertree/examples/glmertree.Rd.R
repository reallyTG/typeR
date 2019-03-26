library(glmertree)


### Name: glmertree
### Title: (Generalized) Linear Mixed Model Trees
### Aliases: lmertree glmertree print.lmertree plot.lmertree coef.lmertree
###   ranef.lmertree logLik.lmertree model.frame.lmertree predict.lmertree
###   terms.lmertree as.party.lmertree residuals.lmertree resid.lmertree
###   print.glmertree plot.glmertree coef.glmertree ranef.glmertree
###   logLik.glmertree model.frame.glmertree predict.glmertree
###   terms.glmertree as.party.glmertree residuals.glmertree
###   resid.glmertree
### Keywords: tree

### ** Examples

## artificial example data
data("DepressionDemo", package = "glmertree")

## fit normal linear regression LMM tree for continuous outcome
lt <- lmertree(depression ~ treatment | cluster | age + anxiety + duration,
  data = DepressionDemo)
print(lt)
plot(lt, which = "all") # default behavior, which may also be "tree" or "ranef" 
coef(lt)
ranef(lt)
predict(lt, type = "response") # default behavior, type may also be "node" 
residuals(lt)

## No test: 
## fit logistic regression GLMM tree for binary outcome
gt <- glmertree(depression_bin ~ treatment | cluster | age + anxiety + duration,
  data = DepressionDemo)
print(gt)
plot(gt, which = "all") # default behavior, which may also be "tree" or "ranef" 
coef(gt)
ranef(gt)
predict(gt, type = "response") # default behavior, type may also be "node" or "link"
residuals(gt)
## End(No test)



