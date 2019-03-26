library(mets)


### Name: bptwin
### Title: Liability model for twin data
### Aliases: bptwin twinlm.time bptwin.time

### ** Examples

data(twinstut)
b0 <- bptwin(stutter~sex,
             data=droplevels(subset(twinstut,zyg%in%c("mz","dz"))),
             id="tvparnr",zyg="zyg",DZ="dz",type="ae")
summary(b0)



