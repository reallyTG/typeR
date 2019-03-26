library(MImix)


### Name: diaph.data
### Title: Diaphanography Partial Verification Bias Example
### Aliases: diaph.data

### ** Examples

data(diaph.data)
attach(diaph.data)
## Calculate sensitivity for each imputed table

sens.imps<-lapply(imputed.tables,function(x){ x[2,2]/(x[2,1]+x[2,2]) })
sens.imps.vars<-lapply(imputed.tables,function(x){ x[2,2]*x[2,1]/(x[2,1]+x[2,2])^3 })

### Calculate mixture summary

MImix(sens.imps,sens.imps.vars)

### Compare to usual t-summary using MIcombine: requires(mitools)

library(mitools)
summary(MIcombine(sens.imps,sens.imps.vars))

### Compare both to the Bayesian posterior estimate

quantile(sens.samples,c(0.025,0.5,0.975))




