library(equaltestMI)


### Name: eqMI.covtest
### Title: Test the equality of two covariance matrices in population
### Aliases: eqMI.covtest

### ** Examples

data(HolzingerSwineford)
semmodel<-'
L1 =~ V1 + V2 + V3
L2 =~ V4 + V5 + V6
L3 =~ V7 + V8
L4 =~ V9 + V10 + V11
'
cov.test <- eqMI.covtest(model = semmodel,
                         data = HolzingerSwineford,
                         group="school")




