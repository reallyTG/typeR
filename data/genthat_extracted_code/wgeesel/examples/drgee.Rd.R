library(wgeesel)


### Name: drgee
### Title: Fit Doubly Robust Weighted Generalized Estimating Equations
### Aliases: drgee
### Keywords: wgee MAR

### ** Examples

data(imps)
fit <- drgee(IMPS79 ~ Drug+Sex+Time, IMPS79 ~ Drug+Sex+Time,
      data=imps, id=imps$ID, family="gaussian",nameTRT="Drug",
       corstr="exchangeable", scale=NULL, mismodel= R ~ Drug+Time)



