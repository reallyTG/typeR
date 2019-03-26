library(vsn)


### Name: vsn2trsf
### Title: Apply the vsn transformation to data
### Aliases: predict,vsn-method

### ** Examples

data("kidney")

## nb: for random subsampling, the 'subsample' argument of vsn
##   provides an easier way to do this
fit = vsn2(kidney[sample(nrow(kidney), 500), ])
tn = predict(fit, newdata=exprs(kidney))




