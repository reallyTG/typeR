library(bdpv)


### Name: BDtest
### Title: Computing confidence intervals for sensitivity, specificity and
###   predictive values assuming a case-control study.
### Aliases: BDtest
### Keywords: htest

### ** Examples


# Reproduce the standard logit interval results in 
# Table IX, Mercaldo et al.(2007)

# 1) Example data: Mercaldo et al.(2007), Table VIII:

Tab8<-matrix(c(240, 178, 87, 288), ncol=2)
colnames(Tab8)<-c("Case","Control")
rownames(Tab8)<-c("ApoEe4plus","ApoEe4minus")
Tab8

# Assuming prevalence=0.03
BDtest(xmat=Tab8, pr=0.03, conf.level = 0.95)

# Assuming prevalence=0.5
BDtest(xmat=Tab8, pr=0.5, conf.level = 0.95)




