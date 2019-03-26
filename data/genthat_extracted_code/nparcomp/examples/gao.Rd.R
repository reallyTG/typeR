library(nparcomp)


### Name: gao
### Title: Nonparametric multiple test procedure for many-to-one
###   comparisons
### Aliases: gao
### Keywords: htest

### ** Examples


data(liver)

gao(weight ~dosage, data=liver,alpha=0.05)

 # Control= 3

gao(weight ~dosage, data=liver,alpha=0.05,control="3")



