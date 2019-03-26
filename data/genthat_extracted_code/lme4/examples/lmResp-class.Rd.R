library(lme4)


### Name: lmResp-class
### Title: Reference Classes for Response Modules,
###   '"(lm|glm|nls|lmer)Resp"'
### Aliases: glmResp-class lmerResp-class lmResp-class nlsResp-class
### Keywords: classes

### ** Examples

showClass("lmResp")
str(lmResp$new(y=1:4))
showClass("glmResp")
str(glmResp$new(family=poisson(), y=1:4))
showClass("nlsResp")
showClass("lmerResp")
str(lmerResp$new(y=1:4))



