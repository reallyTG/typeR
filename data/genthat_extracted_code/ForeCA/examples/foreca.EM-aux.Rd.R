library(ForeCA)


### Name: foreca.EM-aux
### Title: ForeCA EM auxiliary functions
### Aliases: foreca.EM-aux foreca.EM.E_and_M_step foreca.EM.E_step
###   foreca.EM.M_step foreca.EM.h
### Keywords: manip math

### ** Examples

XX <- diff(log(EuStockMarkets)) * 100
UU <- whiten(XX)$U
ff <- mvspectrum(UU, 'wosa', normalize = TRUE)

ww0 <- initialize_weightvector(num.series = ncol(XX), method = 'rnorm')

f.ww0 <- foreca.EM.E_step(ff, ww0)
plot(f.ww0, type = "l")

one.step <- foreca.EM.M_step(ff, f.ww0, 
                             entropy.control = list(prior.weight = 0.1))
image(one.step$matrix)
## Not run: 
##D requireNamespace(LICORS)
##D # if you have the 'LICORS' package use
##D LICORS::image2(one.step$matrix)
## End(Not run)
ww1 <- one.step$vector
f.ww1 <- foreca.EM.E_step(ff, ww1)

layout(matrix(1:2, ncol = 2))
matplot(seq(0, pi, length = length(f.ww0)), cbind(f.ww0, f.ww1), 
        type = "l", lwd =2, xlab = "omega_j", ylab = "f(omega_j)")
plot(f.ww0, f.ww1, pch = ".", cex = 3, xlab = "iteration 0", 
     ylab = "iteration 1", main = "Spectral density")
abline(0, 1, col = 'blue', lty = 2, lwd = 2)

Omega(mvspectrum.output = f.ww0) # start
Omega(mvspectrum.output = f.ww1) # improved after one iteration

ww0 <- initialize_weightvector(NULL, ff, method = "rnorm")
ww1 <- foreca.EM.E_and_M_step(ww0, ff)
ww0
ww1
barplot(rbind(ww0, ww1), beside = TRUE)
abline(h = 0, col = "blue", lty = 2)


foreca.EM.h(ww0, ff)       # iteration 0
foreca.EM.h(ww1, ff, ww0)  # min eigenvalue inequality
foreca.EM.h(ww1, ff)       # KL divergence inequality
one.step$value

# by definition of Omega, they should equal 1 (modulo rounding errors)
Omega(mvspectrum.output = f.ww0) / 100 + foreca.EM.h(ww0, ff)
Omega(mvspectrum.output = f.ww1) / 100 + foreca.EM.h(ww1, ff)




