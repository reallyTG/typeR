library(mistat)


### Name: availDis
### Title: Availability Distribution
### Aliases: availDis
### Keywords: nonparametric distribution ts

### ** Examples

set.seed(123)

Ttf <- rgamma(50, 
              shape=2, 
              scale=100)

Ttr <- rgamma(50, 
              shape=2, 
              scale=1)

AvailEbd <- availDis(ttf=Ttf,  
                     ttr=Ttr, 
                     n=1000)



