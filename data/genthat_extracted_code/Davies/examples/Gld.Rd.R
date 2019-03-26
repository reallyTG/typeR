library(Davies)


### Name: Gld
### Title: The Generalized Lambda Distribution
### Aliases: Gld gld dgld dgld.p pgld qgld rgld
### Keywords: distribution

### ** Examples

params <- c(4.114,0.1333,0.0193,0.1588)  #taken straight from some paper

gld.rv <- rgld(100,params)

hist(gld.rv)
fit.davies.q(gld.rv)  #remember the Davies distn has 3 DF and the GLD 4...



