library(senstrat)


### Name: evall
### Title: Compute expectations and variances for one stratum.
### Aliases: evall
### Keywords: htest robust

### ** Examples

z<-c(rep(0,16),rep(1,23))
CuCells<-c(2.7, .5, 0, 0, 5, 0, 0, 1.3, 0, 1.8, 0, 0, 1.0, 1.8,
           0, 3.1, .7, 4.6, 0, 1.7, 5.2, 0, 5, 9.5, 2, 3, 1, 3.5,
           2, 5, 5.5, 2, 3, 4, 0, 2, 2.2, 0, 2)
evall(rank(CuCells),z,2,"RK")



