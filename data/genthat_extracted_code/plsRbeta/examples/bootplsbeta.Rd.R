library(plsRbeta)


### Name: bootplsbeta
### Title: Non-parametric Bootstrap for PLS generalized linear models
### Aliases: bootplsbeta
### Keywords: models

### ** Examples
## No test: 
data("GasolineYield",package="betareg")

GazYield.boot <- bootplsbeta(plsRbeta(yield~.,data=GasolineYield,nt=3,
modele="pls-beta"), sim="ordinary", stype="i", R=250)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=1)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=2)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=3)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=4)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=5)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=6)

plsRglm::boxplots.bootpls(GazYield.boot)
plsRglm::confints.bootpls(GazYield.boot)
plsRglm::plots.confints.bootpls(plsRglm::confints.bootpls(GazYield.boot))


plot(GazYield.boot,index=2)
boot::jack.after.boot(GazYield.boot, index=2, useJ=TRUE, nt=3)
plot(GazYield.boot, index=2,jack=TRUE)

# PLS bootstrap balanced

GazYield.boot <- bootplsbeta(plsRbeta(yield~.,data=GasolineYield,nt=3,
modele="pls-beta"), sim="balanced", stype="i", R=250)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=1)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=2)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=3)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=4)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=5)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=6)


plsRglm::boxplots.bootpls(GazYield.boot)
plsRglm::confints.bootpls(GazYield.boot)
plsRglm::plots.confints.bootpls(plsRglm::confints.bootpls(GazYield.boot))



plot(GazYield.boot)
boot::jack.after.boot(GazYield.boot, index=1, useJ=TRUE, nt=3)
plot(GazYield.boot,jack=TRUE)


# PLS permutation bootstrap

GazYield.boot <- bootplsbeta(plsRbeta(yield~.,data=GasolineYield,nt=3,
modele="pls-beta"), sim="permutation", stype="i", R=250)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc"), index=1)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc"), index=2)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc"), index=3)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc"), index=4)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc"), index=5)
boot::boot.ci(GazYield.boot, conf = c(0.90,0.95), type = c("norm","basic","perc"), index=6)
plsRglm::boxplots.bootpls(GazYield.boot)
plot(GazYield.boot)
## End(No test)



