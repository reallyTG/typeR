library(brr)


### Name: GB2Dist
### Title: Gamma-Beta2 distribution
### Aliases: GB2Dist dGB2 moment_GB2 pGB2 qGB2 rGB2 summary_GB2

### ** Examples

a <- 2 ; c <- 4 ; d <- 3; tau <- 1.67
sims <- rGB2(1e6, a, c, d, tau)
mean(sims); moment_GB2(1,a,c,d,tau)
mean(sims^2); moment_GB2(2,a,c,d,tau)
summary_GB2(a,c,d,tau)



