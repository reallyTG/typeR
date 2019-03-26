library(spatstat)


### Name: rmhmodel.list
### Title: Define Point Process Model for Metropolis-Hastings Simulation.
### Aliases: rmhmodel.list
### Keywords: spatial datagen

### ** Examples

   # Strauss process:
   mod01 <- list(cif="strauss",par=list(beta=2,gamma=0.2,r=0.7),
                 w=c(0,10,0,10))
   mod01 <- rmhmodel(mod01)

   # Strauss with hardcore:
   mod04 <- list(cif="straush",par=list(beta=2,gamma=0.2,r=0.7,hc=0.3),
                w=owin(c(0,10),c(0,5)))
   mod04 <- rmhmodel(mod04)

   # Soft core:
   w    <- square(10)
   mod07 <- list(cif="sftcr",
                     par=list(beta=0.8,sigma=0.1,kappa=0.5),
                     w=w)
   mod07 <- rmhmodel(mod07)
   
   # Multitype Strauss:
   beta <- c(0.027,0.008)
   gmma <- matrix(c(0.43,0.98,0.98,0.36),2,2)
   r    <- matrix(c(45,45,45,45),2,2)
   mod08 <- list(cif="straussm",
                     par=list(beta=beta,gamma=gmma,radii=r),
                     w=square(250))
   mod08 <- rmhmodel(mod08)

   # specify types
   mod09 <- rmhmodel(list(cif="straussm",
                     par=list(beta=beta,gamma=gmma,radii=r),
                     w=square(250),
                     types=c("A", "B")))

   # Multitype Strauss hardcore with trends for each type:
   beta  <- c(0.27,0.08)
   ri    <- matrix(c(45,45,45,45),2,2)
   rhc  <- matrix(c(9.1,5.0,5.0,2.5),2,2)
   tr3   <- function(x,y){x <- x/250; y <- y/250;
   			   exp((6*x + 5*y - 18*x^2 + 12*x*y - 9*y^2)/6)
                         }
                         # log quadratic trend
   tr4   <- function(x,y){x <- x/250; y <- y/250;
                         exp(-0.6*x+0.5*y)}
                        # log linear trend
   mod10 <- list(cif="straushm",par=list(beta=beta,gamma=gmma,
                 iradii=ri,hradii=rhc),w=c(0,250,0,250),
                 trend=list(tr3,tr4))
   mod10 <- rmhmodel(mod10)

   # Lookup (interaction function h_2 from page 76, Diggle (2003)):
   r <- seq(from=0,to=0.2,length=101)[-1] # Drop 0.
   h <- 20*(r-0.05)
   h[r<0.05] <- 0
   h[r>0.10] <- 1
   mod17 <- list(cif="lookup",par=list(beta=4000,h=h,r=r),w=c(0,1,0,1))
   mod17 <- rmhmodel(mod17)



