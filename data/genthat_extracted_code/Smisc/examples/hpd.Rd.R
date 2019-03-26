library(Smisc)


### Name: hpd
### Title: Calculate the highest posterior density credible interval for a
###   unimodal density
### Aliases: hpd print.hpd plot.hpd

### ** Examples

## No test: 
# A credible interval using the standard normal
int <- hpd(dnorm, c(-5,5), prob = 0.90, njobs = 2)
print(int)
plot(int)
## End(No test)

# A credible interval with the gamma density
int <- hpd(function(x) dgamma(x, shape = 2, rate = 0.5), c(0, 20),
           cdf = function(x) pgamma(x, shape = 2, rate = 0.5), prob = 0.8)
print(int)
plot(int)

## No test: 
# A credible interval using the Beta density
dens <- function(x) dbeta(x, 7, 12)
dist <- function(x) pbeta(x, 7, 12)
int <- hpd(dens, c(0, 1), cdf = dist)
print(int)
plot(int)
## End(No test)



