library(gtcorr)


### Name: gtcorr.matrix
### Title: Calculate the efficiency of matrix group testing procedures for
###   rectangular, diagonal, and random arrangements
### Aliases: gtcorr.matrix

### ** Examples

##Plot efficiencies of a 16 by 16 matrix procedure by arrangement
sigma <- seq(0,.99, length.out=100)
sig2 <- seq(0, .99, length.out=10)
diag <- gtcorr.matrix(r=16, c=16, m=16, r.prime=1, c.prime=16,
                      arr='diag', p=.05, sigma=sigma)$efficiency
rand <- gtcorr.matrix(r=16, c=16, m=16, r.prime=1, c.prime=16,
                      arr='rand', p=.05, sigma=sig2)$efficiency 
rect1 <- gtcorr.matrix(r=16, c=16, m=16, r.prime=1, c.prime=16, p=.05,
                       sigma=sigma)$efficiency 
rect2 <- gtcorr.matrix(r=16, c=16, m=16, r.prime=2, c.prime=8, p=.05,
                       sigma=sigma)$efficiency 
rect3 <- gtcorr.matrix(r=16, c=16, m=16, r.prime=4, c.prime=4, p=.05,
                       sigma=sigma)$efficiency 

plot(sigma, diag, ylim=c(0, max(diag)), type='l', ylab="Efficiency", xlab="sigma")
lines(sig2, rand, col=2)
lines(sigma, rect3, col=3)
lines(sigma, rect2, col=4)
lines(sigma, rect1, col=5)
legend("bottomleft", c("Diagonal", "Random", "4x4 rect.", "2x8 rect.",
                       "1x16 rect."), lty=1, col=1:5) 



