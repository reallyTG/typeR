library(rstan)


### Name: read_rdump
### Title: Read data in an R dump file to a list
### Aliases: read_rdump
### Keywords: rstan

### ** Examples

x <- 1; y <- 1:10; z <- array(1:10, dim = c(2,5)) 
stan_rdump(ls(pattern = '^[xyz]'), "xyz.Rdump")
l <- read_rdump('xyz.Rdump')
print(l) 



