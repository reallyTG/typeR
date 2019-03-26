library(flexmix)


### Name: Mehta
### Title: Mehta Trial
### Aliases: Mehta
### Keywords: datasets

### ** Examples

data("Mehta", package = "flexmix")
mehtaMix <- initFlexmix(cbind(Response, Total-Response) ~ 1|Site, 
                        data = Mehta, nrep = 5, k = 3,
                        model = FLXMRglmfix(family = "binomial",
                          fixed = ~ Drug), 
                        control = list(minprior = 0.04))



