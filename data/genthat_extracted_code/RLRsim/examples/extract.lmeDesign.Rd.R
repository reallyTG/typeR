library(RLRsim)


### Name: extract.lmeDesign
### Title: Extract the Design of a linear mixed model
### Aliases: extract.lmeDesign extract.lmerModDesign
### Keywords: utilities

### ** Examples


library(nlme)
design <- extract.lmeDesign(lme(distance ~ age + Sex, data = Orthodont, 
                             random = ~ 1))
str(design)




