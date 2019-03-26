library(genSurv)


### Name: genTHMM
### Title: Generation of survival data from a time-homogeneous Markov model
### Aliases: genTHMM
### Keywords: datagen survival

### ** Examples

thmmdata <- genTHMM( n=100, model.cens="uniform", cens.par=80, beta= c(0.09,0.08,-0.09),
covar=80, rate= c(0.05,0.04,0.05) )
head(thmmdata, n=20L)



