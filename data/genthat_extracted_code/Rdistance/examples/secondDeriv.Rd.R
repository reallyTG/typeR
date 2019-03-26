library(Rdistance)


### Name: secondDeriv
### Title: Numeric second derivatives
### Aliases: secondDeriv

### ** Examples


func <- function(x){-x*x} # second derivative should be -2
secondDeriv(0,func)
secondDeriv(3,func)

func <- function(x){3 + 5*x^2 + 2*x^3} # second derivative should be 10+12x
secondDeriv(0,func)
secondDeriv(2,func)

func <- function(x){x[1]^2 + 5*x[2]^2} # should be rbind(c(2,0),c(0,10))
secondDeriv(c(1,1),func)




