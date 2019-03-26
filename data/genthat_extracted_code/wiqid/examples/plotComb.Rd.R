library(wiqid)


### Name: plotComb
### Title: Display a posterior probability distribution from the comb
###   method
### Aliases: plotComb
### Keywords: hplot

### ** Examples

# Generate some data:
N <- 0:100
post <- dpois(N, 25)
# Do the plots:
plotComb(N, post)
plotComb(N, post, showMode=TRUE, shadeHDI='pink', xlim=c(10, 50))

# A bimodal distribution:
post2 <- (dnorm(N, 28, 8) + dnorm(N, 70, 11)) / 2
plotComb(N, post2, credMass=0.99, shade='pink')
plotComb(N, post2, credMass=0.80, shade='grey')




