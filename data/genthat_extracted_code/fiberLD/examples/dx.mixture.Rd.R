library(fiberLD)


### Name: dx.mixture
### Title: Mixture density functions of the cell lengths in the increment
###   core
### Aliases: dx.mixture dy.mixture dw.mixture

### ** Examples

## Not run: 
##D  
##D  library(fiberLD)
##D  data(cell.length) 
##D  r <- 6
##D  d <- fled(data=cell.length,model="lognorm",r=r)
##D  x <- seq(0, 8,length=100)
##D  f1 <- dx.mixture(x=x, par=d$par,r=r, model="lognorm")
##D  plot(x,f1,type="l")
##D 
##D  w <- seq(0, 2*r+2,length=150)
##D  f2 <- dy.mixture(w, d$par, model="lognorm")
##D  f3 <- dw.mixture(w, d$par, 6, model="lognorm")
##D  plot(w,f3,type="l")
## End(Not run)



