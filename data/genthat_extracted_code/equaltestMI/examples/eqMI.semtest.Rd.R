library(equaltestMI)


### Name: eqMI.semtest
### Title: Measurement invariance tests using Lavaan
### Aliases: eqMI.semtest

### ** Examples

data(HolzingerSwineford)
semmodel<-'
L1 =~ V1 + V2 + V3
L2 =~ V4 + V5 + V6
L3 =~ V7 + V8
L4 =~ V9 + V10 + V11
'
## Not run: 
##D run.sem <- eqMI.semtest(model = semmodel, data = HolzingerSwineford,
##D            group = "school", meanstructure = TRUE)
## End(Not run)



