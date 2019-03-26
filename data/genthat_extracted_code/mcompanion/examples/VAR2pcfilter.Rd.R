library(mcompanion)


### Name: VAR2pcfilter
### Title: PAR representations of VAR models
### Aliases: VAR2pcfilter
### Keywords: ts

### ** Examples

## create a pc filter
rfi <- sim_pcfilter(2,3)
rfi$pcfilter

## turn it into VAR form
flt <- new("MultiFilter", coef = rfi$pcfilter)
I1 <- mf_VSform(flt, form="I")

## from VAR to scalar form
flt2 <- VAR2pcfilter(I1$Phi, Sigma = I1$Phi0inv %*% t(I1$Phi0inv))

## confirm that we are back to the original
##   (VAR2pcfilter doesn't drop redundant zeroes, so we do it manually)
all.equal(flt2[ , 1:3], rfi$pcfilter) ## TRUE



