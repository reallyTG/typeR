library(metafor)


### Name: coef.permutest.rma.uni
### Title: Extract the Model Coefficient Table from 'permutest.rma.uni'
###   Objects
### Aliases: coef.permutest.rma.uni
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a mixed-effects model
### with two moderators (absolute latitude and publication year)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, 
           mods = ~ ablat + year, data=dat.bcg)

### permutation test
## Not run: 
##D pres <- permutest(res)
##D coef(pres)
## End(Not run)



