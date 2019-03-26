library(Bhat)


### Name: logit.hessian
### Title: Hessian (curvature matrix)
### Aliases: logit.hessian
### Keywords: array iteration methods optimize

### ** Examples

  ## Rosenbrock Banana function
   fr <- function(x) {
         x1 <- x[1]
         x2 <- x[2]
         100 * (x2 - x1 * x1)^2 + (1 - x1)^2
    }
  ## define
   x <- list(label=c("a","b"),est=c(1,1),low=c(-100,-100),upp=c(100,100))
   logit.hessian(x,f=fr,del=dqstep(x,f=fr,sens=0.01))
  ## shows the differences in curvature at the minimum of the Banana
  ## function along principal axis (in a logit-transformed coordinate system)



