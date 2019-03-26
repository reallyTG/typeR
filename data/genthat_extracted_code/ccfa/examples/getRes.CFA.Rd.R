library(ccfa)


### Name: getRes.CFA
### Title: getRes.CFA
### Aliases: getRes.CFA

### ** Examples

data(igm)
tvals <- seq(10,12,length.out=8)
yvals <- seq(quantile(igm$lcfincome, .05), quantile(igm$lcfincome, .95),
  length.out=50)

## obtain counterfactual results
cfaresults <- cfa(lcfincome ~ lfincome, tvals=tvals, yvals=yvals, data=igm,
 se=FALSE)

## get the average outcome (lfincome) as a function of the treatment
## variable (lfincome)
getRes.CFA(cfaresults, E, se=FALSE)

## get the variance of the outcomes as a function of the treatment
## variable
getRes.CFA(cfaresults, Var, se=FALSE)

## get the inter-quantile range of outcomes as a function of the
## treatment variable
getRes.CFA(cfaresults, IQR, se=FALSE, t1=0.9, t2=0.1)




