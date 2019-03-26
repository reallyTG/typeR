library(swfscMisc)


### Name: uniform.test
### Title: Uniform Distribution Test
### Aliases: uniform.test

### ** Examples

x.unif <- runif(100)
uniform.test(hist(x.unif), B = 1000)
x.lnorm <- rlnorm(100)
uniform.test(hist(x.lnorm), B = 1000)




