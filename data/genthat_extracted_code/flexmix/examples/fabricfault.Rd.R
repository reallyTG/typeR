library(flexmix)


### Name: fabricfault
### Title: Fabric Faults
### Aliases: fabricfault
### Keywords: datasets

### ** Examples

data("fabricfault", package = "flexmix")
fabricMix <- initFlexmix(Faults ~ 1, data = fabricfault, k = 2,
                         model = FLXMRglmfix(family = "poisson",
                           fixed = ~ log(Length)), 
                         nrep = 5)



