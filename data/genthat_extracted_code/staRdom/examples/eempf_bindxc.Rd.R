library(staRdom)


### Name: eempf_bindxc
### Title: Combining extracted components of PARAFAC models
### Aliases: eempf_bindxc

### ** Examples


data(pf_models)
pfmodel <- pf4[[1]]
comps <- eempf_excomp(pfmodel,c(1,3))
comps2 <- eempf_excomp(pfmodel,c(4,6))
comps3 <- eempf_bindxc(list(comps, comps2))




