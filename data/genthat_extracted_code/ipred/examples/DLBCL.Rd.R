library(ipred)


### Name: DLBCL
### Title: Diffuse Large B-Cell Lymphoma
### Aliases: DLBCL
### Keywords: datasets

### ** Examples


set.seed(290875)

data("DLBCL", package="ipred")
library("survival")
survfit(Surv(time, cens) ~ 1, data=DLBCL)




