library(brr)


### Name: PGB2Dist
### Title: Poisson-Gamma-Beta2 distribution
### Aliases: PGB2Dist dPGB2 pPGB2 qPGB2 rPGB2 summary_PGB2

### ** Examples

a <- 2 ; c <- 5 ; d <- 30; tau <- 2
barplot(dPGB2(0:40, a, c, d, tau), names=0:40)
summary_PGB2(a,c,d,tau, output="pandoc")



