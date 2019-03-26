library(survival)


### Name: attrassign
### Title: Create new-style "assign" attribute
### Aliases: attrassign.default attrassign attrassign.lm
### Keywords: models

### ** Examples

formula <- Surv(time,status)~factor(ph.ecog)
tt <- terms(formula)
mf <- model.frame(tt,data=lung)
mm <- model.matrix(tt,mf)
## a few rows of data
mm[1:3,]
## old-style assign attribute
attr(mm,"assign")
## alternate style assign attribute
attrassign(mm,tt)



