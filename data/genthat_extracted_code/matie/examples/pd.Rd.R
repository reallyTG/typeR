library(matie)


### Name: pd
### Title: Plot density (after an 'ma' calculation).
### Aliases: pd
### Keywords: density contour

### ** Examples

    f <- function(x,name="Sinusoidal",def="y = 1 + sin(x)"){
      return(1 + sin(x))
    }
    d <- sbd(f,min=-2*pi,max=2*pi,n=1000,Rsq=0.9)
    ma(d)$A
    dist <- pd(d)



