library(flexmix)


### Name: trypanosome
### Title: Trypanosome
### Aliases: trypanosome
### Keywords: datasets

### ** Examples

data("trypanosome", package = "flexmix")
trypMix <- initFlexmix(cbind(Dead, 1-Dead) ~ 1, k = 2, 
	               nrep = 5, data = trypanosome,
	               model = FLXMRglmfix(family = "binomial",
                           fixed = ~log(Dose)))



