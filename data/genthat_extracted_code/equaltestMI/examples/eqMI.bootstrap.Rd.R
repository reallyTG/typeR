library(equaltestMI)


### Name: eqMI.bootstrap
### Title: Bootstrap procedure for projection-based latent means equality
###   test
### Aliases: eqMI.bootstrap

### ** Examples

data(HolzingerSwineford)
semmodel<-'
L1 =~ V1 + V2 + V3
L2 =~ V4 + V5 + V6
L3 =~ V7 + V8
L4 =~ V9 + V10 + V11
'
## Not run: 
##D run.bts <- eqMI.bootstrap(model = semmodel, data = HolzingerSwineford,
##D           group = "school", meanstructure = TRUE, B = 100, seed = 111)
## End(Not run)



