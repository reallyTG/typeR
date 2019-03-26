library(mistat)


### Name: renewDis
### Title: Renewals Disribution
### Aliases: renewDis
### Keywords: nonparametric distribution ts

### ** Examples

set.seed(123)

Ttf <- rgamma(50, 
              shape=2, 
              scale=100)

Ttr <- rgamma(50, 
              shape=2, 
              scale=1)

RenewEbd <- renewDis(ttf=Ttf, 
                     ttr=Ttr, 
                     time=1000, 
                     n=1000)



