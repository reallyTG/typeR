library(wgeesel)


### Name: wgeesel-package
### Title: Weighted Generalized Estimating Equations and Model Selection
### Aliases: wgeesel-package wgeesel
### Keywords: gee wgee package qic

### ** Examples

data(imps)

fit <- wgee(Y ~ Drug+Sex+Time,data=imps,id=imps$ID,family="binomial",
            corstr="exchangeable",scale=NULL,mismodel= R ~ Drug+Time)




