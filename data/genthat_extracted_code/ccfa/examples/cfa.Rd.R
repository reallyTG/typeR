library(ccfa)


### Name: cfa
### Title: cfa
### Aliases: cfa cfa-package

### ** Examples

data(igm)
tvals <- seq(10,12,length.out=8)
yvals <- seq(quantile(igm$lcfincome, .05), quantile(igm$lcfincome, .95), length.out=50)
## This line doesn't adjust for any covariates
cfa(lcfincome ~ lfincome, tvals=tvals, yvals=yvals, data=igm,
 se=FALSE)

## This line adjusts for differences in education
cfa(lcfincome ~ lfincome, ~HEDUC, tvals=tvals, yvals=yvals, data=igm,
 se=FALSE)




