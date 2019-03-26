library(matie)


### Name: sbd
### Title: Generates sample bivariate data.
### Aliases: sbd
### Keywords: coefficient of determination

### ** Examples

    f <- function(x,name="Sinusoidal",def="y = 1 + sin(x)"){
      return(1 + sin(x))
    }
    d <- sbd(f,min=-2*pi,max=2*pi,n=500,Rsq=0.9)
    ma(d)$A
    plot(d)



