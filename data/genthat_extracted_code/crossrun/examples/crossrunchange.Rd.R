library(crossrun)


### Name: crossrunchange
### Title: Joint Distribution for Crossings and Runs, Varying Success
###   Probability.
### Aliases: crossrunchange

### ** Examples

prob10 <- c(rep(.5,5),rep(.7,5))
crchange10 <- crossrunchange(nmax=10, prob=prob10,printn=TRUE)
print(crchange10$pt[[10]])



