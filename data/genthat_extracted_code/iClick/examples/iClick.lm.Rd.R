library(iClick)


### Name: iClick.lm
### Title: iClick GUI for linear model
### Aliases: iClick.lm

### ** Examples

data("FFplusMOM")
iClick.lm(dep=2,indep=c(3,5:6),data=FFplusMOM, bootrep=9)

#Eq=RET~(MK_BETA+HML_BETA+SMB_BETA)^2
#iClick.lm(Formula=Eq,data=FFplusMOM, bootrep=9)



