library(glmmTMB)


### Name: expandAllGrpVar
### Title: expand interactions/combinations of grouping variables
### Aliases: expandAllGrpVar
### Keywords: internal

### ** Examples

ff <- glmmTMB:::fbx(y~1+(x|f/g))
glmmTMB:::expandAllGrpVar(ff)
glmmTMB:::expandAllGrpVar(quote(1|(f/g)/h))
glmmTMB:::expandAllGrpVar(quote(1|f/g/h))
glmmTMB:::expandAllGrpVar(quote(1|f*g))



