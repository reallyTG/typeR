library(LPCM)


### Name: ms
### Title: Mean shift clustering.
### Aliases: ms meanshift ms.rep ms.self.coverage
### Keywords: multivariate

### ** Examples

data(faithful)
# Mean shift clustering with user-defined bandwidth (5 percent of data range)
fit <- ms(faithful, h=0.05)

# Goodness-of-fit
coverage(fit$data, fit$cluster.center)
Rc(fit)

# Bandwidth selection via self-coverage
## Not run: 
##D foo <- ms.self.coverage(faithful,gridsize= 50, taumin=0.1,
##D taumax=0.5, plot.type="o")   
##D h <- select.self.coverage(foo)$select
##D fit <- ms(faithful,h=h[1])
## End(Not run)




