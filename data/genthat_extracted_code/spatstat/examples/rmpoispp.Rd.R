library(spatstat)


### Name: rmpoispp
### Title: Generate Multitype Poisson Point Pattern
### Aliases: rmpoispp
### Keywords: spatial datagen

### ** Examples

 # uniform bivariate Poisson process with total intensity 100 in unit square
 pp <- rmpoispp(50, types=c("a","b"))
 
 # stationary bivariate Poisson process with intensity A = 30, B = 70
 pp <- rmpoispp(c(30,70), types=c("A","B"))
 pp <- rmpoispp(c(30,70))

 # works in any window
 data(letterR)
 pp <- rmpoispp(c(30,70), win=letterR, types=c("A","B"))

 # inhomogeneous lambda(x,y,m)
 # note argument 'm' is a factor 
 lam <- function(x,y,m) { 50 * (x^2 + y^3) * ifelse(m=="A", 2, 1)}
 pp <- rmpoispp(lam, win=letterR, types=c("A","B"))
 # extra arguments
 lam <- function(x,y,m,scal) { scal * (x^2 + y^3) * ifelse(m=="A", 2, 1)}
 pp <- rmpoispp(lam, win=letterR, types=c("A","B"), scal=50)

 # list of functions lambda[[i]](x,y)
 lams <- list(function(x,y){50 * x^2}, function(x,y){20 * abs(y)})
 pp <- rmpoispp(lams, win=letterR, types=c("A","B"))
 pp <- rmpoispp(lams, win=letterR)
 # functions with extra arguments
 lams <- list(function(x,y,scal){5 * scal * x^2},
              function(x,y, scal){2 * scal * abs(y)})
 pp <- rmpoispp(lams, win=letterR, types=c("A","B"), scal=10)
 pp <- rmpoispp(lams, win=letterR, scal=10)

 # florid example
 lams <- list(function(x,y){
   			   100*exp((6*x + 5*y - 18*x^2 + 12*x*y - 9*y^2)/6)
                         }
                         # log quadratic trend
              ,
              function(x,y){
                         	   100*exp(-0.6*x+0.5*y)
                         }
                        # log linear trend
              )
  X <- rmpoispp(lams, win=unit.square(), types=c("on", "off"))   

 # pixel image
 Z <- as.im(function(x,y){30 * (x^2 + y^3)}, letterR)
 pp <- rmpoispp(Z, types=c("A","B"))

 # list of pixel images
 ZZ <- list(
          as.im(function(x,y){20 * (x^2 + y^3)}, letterR),
          as.im(function(x,y){40 * (x^3 + y^2)}, letterR))
 pp <- rmpoispp(ZZ, types=c("A","B"))
 pp <- rmpoispp(ZZ)

 # randomising an existing point pattern
 rmpoispp(intensity(amacrine), win=Window(amacrine))



