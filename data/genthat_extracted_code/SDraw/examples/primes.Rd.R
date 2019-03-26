library(SDraw)


### Name: primes
### Title: Prime numbers
### Aliases: primes

### ** Examples

primes(4) #  c(2,3,5,7)    

# Prime pairs in the first 100
p <- primes(100)
p.diff <- diff(p)
cbind(p[-length(p)][p.diff==2], p[-1][p.diff==2])



