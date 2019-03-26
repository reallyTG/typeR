library(Hmisc)


### Name: rMultinom
### Title: Generate Multinomial Random Variables with Varying Probabilities
### Aliases: rMultinom
### Keywords: distribution

### ** Examples

set.seed(1)
w <- rMultinom(rbind(c(.1,.2,.3,.4),c(.4,.3,.2,.1)),200)
t(apply(w, 1, table)/200)



