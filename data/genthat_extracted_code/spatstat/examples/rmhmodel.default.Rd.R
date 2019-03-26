library(spatstat)


### Name: rmhmodel.default
### Title: Build Point Process Model for Metropolis-Hastings Simulation.
### Aliases: rmhmodel.default
### Keywords: spatial datagen

### ** Examples

   # Strauss process:
   mod01 <- rmhmodel(cif="strauss",par=list(beta=2,gamma=0.2,r=0.7),
                 w=c(0,10,0,10))
   mod01
   # The above could also be simulated using 'rStrauss'

   # Strauss with hardcore:
   mod04 <- rmhmodel(cif="straush",par=list(beta=2,gamma=0.2,r=0.7,hc=0.3),
                w=owin(c(0,10),c(0,5)))

   # Hard core:
   mod05 <- rmhmodel(cif="hardcore",par=list(beta=2,hc=0.3),
              w=square(5))

   # Soft core:
   w    <- square(10)
   mod07 <- rmhmodel(cif="sftcr",
                     par=list(beta=0.8,sigma=0.1,kappa=0.5),
                     w=w)
   
   # Area-interaction process:
   mod42 <- rmhmodel(cif="areaint",par=list(beta=2,eta=1.6,r=0.7),
                 w=c(0,10,0,10))

   # Baddeley-Geyer process:
   mod99 <- rmhmodel(cif="badgey",par=list(beta=0.3,
                     gamma=c(0.2,1.8,2.4),r=c(0.035,0.07,0.14),sat=5),
                     w=unit.square())

   # Multitype Strauss:
   beta <- c(0.027,0.008)
   gmma <- matrix(c(0.43,0.98,0.98,0.36),2,2)
   r    <- matrix(c(45,45,45,45),2,2)
   mod08 <- rmhmodel(cif="straussm",
                     par=list(beta=beta,gamma=gmma,radii=r),
                     w=square(250))
   # specify types
   mod09 <- rmhmodel(cif="straussm",
                     par=list(beta=beta,gamma=gmma,radii=r),
                     w=square(250),
                     types=c("A", "B"))

   # Multitype Hardcore:
   rhc  <- matrix(c(9.1,5.0,5.0,2.5),2,2)
   mod08hard <- rmhmodel(cif="multihard",
                     par=list(beta=beta,hradii=rhc),
                     w=square(250),
                     types=c("A", "B"))

   
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
   mod10 <- rmhmodel(cif="straushm",par=list(beta=beta,gamma=gmma,
                 iradii=ri,hradii=rhc),w=c(0,250,0,250),
                 trend=list(tr3,tr4))

   # Triplets process:
   mod11 <- rmhmodel(cif="triplets",par=list(beta=2,gamma=0.2,r=0.7),
                 w=c(0,10,0,10))

   # Lookup (interaction function h_2 from page 76, Diggle (2003)):
      r <- seq(from=0,to=0.2,length=101)[-1] # Drop 0.
      h <- 20*(r-0.05)
      h[r<0.05] <- 0
      h[r>0.10] <- 1
      mod17 <- rmhmodel(cif="lookup",par=list(beta=4000,h=h,r=r),w=c(0,1,0,1))

  # hybrid model
  modhy <- rmhmodel(cif=c('strauss', 'geyer'),
                    par=list(list(beta=100,gamma=0.5,r=0.05),
                             list(beta=1, gamma=0.7,r=0.1, sat=2)),
                    w=square(1))
  modhy



