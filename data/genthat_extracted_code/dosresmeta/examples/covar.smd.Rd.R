library(dosresmeta)


### Name: covar.smd
### Title: Computes mean and standardized mean differences for continuous
###   outcome with corresponding co(variance) matrix
### Aliases: covar.smd

### ** Examples

## Loading the data
data("ari")

## Obtaining standardized mean differences, variances, and (co)varinace 
## matrix for the first study (id = 1)
covar.smd(y, sd, n, measure = "smd", data = subset(ari, id == 1))

## Obtaining mean differences, variances, and (co)varinace matrices for the all the studies
cov.md <- by(ari, ari$id, function(x) covar.smd(y, sd, n, "md", data = x))

## Extracting mean differences
unlist(lapply(cov.md, function(x) x$y))
## Extracting variances for the mean differences
unlist(lapply(cov.md, function(x) x$v))
## List of the (co)variance matrices for the mean differences
lapply(cov.md, function(x) x$S)
 



