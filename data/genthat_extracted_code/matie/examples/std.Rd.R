library(matie)


### Name: std
### Title: Generates sample trivariate data set.
### Aliases: std
### Keywords: coefficient of determination

### ** Examples

    f <- function(x,y,name="MexicanHat", def="z=(1-t^2)exp(-t^2div2), t^2=x^2+y^2"){
      t <- sqrt(x^2 + y^2)
      z <- (1.0 - t^2) * exp(- t * t / 2)
      return(z)
    }
    d <- std(f, xMin=-2, xMax=2, yMin=-2, yMax=2, n=500, Rsq=0.85)
    ma(d)$A
    # if you have rgl you can view the data set in 3D 
    # library("rgl")  
    # plot3d(d)



