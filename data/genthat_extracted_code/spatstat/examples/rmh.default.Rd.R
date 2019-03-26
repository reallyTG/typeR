library(spatstat)


### Name: rmh.default
### Title: Simulate Point Process Models using the Metropolis-Hastings
###   Algorithm.
### Aliases: rmh.default
### Keywords: spatial datagen

### ** Examples

   if(interactive()) {
     nr   <- 1e5
     nv  <- 5000
     ns <- 200
   } else {
     nr  <- 10
     nv <- 5
     ns <- 20
     oldopt <- spatstat.options()
     spatstat.options(expand=1.1)
   }
   set.seed(961018)
   
   # Strauss process.
   mod01 <- list(cif="strauss",par=list(beta=2,gamma=0.2,r=0.7),
                 w=c(0,10,0,10))
   X1.strauss <- rmh(model=mod01,start=list(n.start=ns),
                     control=list(nrep=nr,nverb=nv))

   if(interactive()) plot(X1.strauss)
   
   # Strauss process, conditioning on n = 42:
   X2.strauss <- rmh(model=mod01,start=list(n.start=42),
                     control=list(p=1,nrep=nr,nverb=nv))

   # Tracking algorithm progress:
   X <- rmh(model=mod01,start=list(n.start=ns),
            control=list(nrep=nr, nsave=nr/5, nburn=nr/2, track=TRUE))
   History <- attr(X, "history")
   Saved <- attr(X, "saved")
   head(History)
   plot(Saved)

   # Hard core process:
   mod02 <- list(cif="hardcore",par=list(beta=2,hc=0.7),w=c(0,10,0,10))
   X3.hardcore <- rmh(model=mod02,start=list(n.start=ns),
                     control=list(nrep=nr,nverb=nv))
   
   if(interactive()) plot(X3.hardcore)

   # Strauss process equal to pure hardcore:
   mod02s <- list(cif="strauss",par=list(beta=2,gamma=0,r=0.7),w=c(0,10,0,10))
   X3.strauss <- rmh(model=mod02s,start=list(n.start=ns),
                     control=list(nrep=nr,nverb=nv))
   
   # Strauss process in a polygonal window.
   x     <- c(0.55,0.68,0.75,0.58,0.39,0.37,0.19,0.26,0.42)
   y     <- c(0.20,0.27,0.68,0.99,0.80,0.61,0.45,0.28,0.33)
   mod03 <- list(cif="strauss",par=list(beta=2000,gamma=0.6,r=0.07),
                w=owin(poly=list(x=x,y=y)))
   X4.strauss <- rmh(model=mod03,start=list(n.start=ns),
                     control=list(nrep=nr,nverb=nv))
   if(interactive()) plot(X4.strauss)
   
   # Strauss process in a polygonal window, conditioning on n = 80.
   X5.strauss <- rmh(model=mod03,start=list(n.start=ns),
                     control=list(p=1,nrep=nr,nverb=nv))
   
   # Strauss process, starting off from X4.strauss, but with the
   # polygonal window replace by a rectangular one.  At the end,
   # the generated pattern is clipped to the original polygonal window.
   xxx <- X4.strauss
   Window(xxx) <- as.owin(c(0,1,0,1))
   X6.strauss <- rmh(model=mod03,start=list(x.start=xxx),
                     control=list(nrep=nr,nverb=nv))
   
   # Strauss with hardcore:
   mod04 <- list(cif="straush",par=list(beta=2,gamma=0.2,r=0.7,hc=0.3),
                w=c(0,10,0,10))
   X1.straush <- rmh(model=mod04,start=list(n.start=ns),
                     control=list(nrep=nr,nverb=nv))
   
   # Another Strauss with hardcore (with a perhaps surprising result):
   mod05 <- list(cif="straush",par=list(beta=80,gamma=0.36,r=45,hc=2.5),
                w=c(0,250,0,250))
   X2.straush <- rmh(model=mod05,start=list(n.start=ns),
                     control=list(nrep=nr,nverb=nv))
   
   # Pure hardcore (identical to X3.strauss).
   mod06 <- list(cif="straush",par=list(beta=2,gamma=1,r=1,hc=0.7),
                w=c(0,10,0,10))
   X3.straush <- rmh(model=mod06,start=list(n.start=ns),
                     control=list(nrep=nr,nverb=nv))
   
   # Soft core:
   w    <- c(0,10,0,10)
   mod07 <- list(cif="sftcr",par=list(beta=0.8,sigma=0.1,kappa=0.5),
                w=c(0,10,0,10))
   X.sftcr <- rmh(model=mod07,start=list(n.start=ns),
                  control=list(nrep=nr,nverb=nv))
   if(interactive()) plot(X.sftcr)

   # Area-interaction process:
   mod42 <- rmhmodel(cif="areaint",par=list(beta=2,eta=1.6,r=0.7),
                 w=c(0,10,0,10))
   X.area <- rmh(model=mod42,start=list(n.start=ns),
                  control=list(nrep=nr,nverb=nv))
   if(interactive()) plot(X.area)

   # Triplets process
   modtrip <- list(cif="triplets",par=list(beta=2,gamma=0.2,r=0.7),
                   w=c(0,10,0,10))
   X.triplets <- rmh(model=modtrip,
                     start=list(n.start=ns),
                     control=list(nrep=nr,nverb=nv))
   if(interactive()) plot(X.triplets)
   
   # Multitype Strauss:
   beta <- c(0.027,0.008)
   gmma <- matrix(c(0.43,0.98,0.98,0.36),2,2)
   r    <- matrix(c(45,45,45,45),2,2)
   mod08 <- list(cif="straussm",par=list(beta=beta,gamma=gmma,radii=r),
                w=c(0,250,0,250))
   X1.straussm <- rmh(model=mod08,start=list(n.start=ns),
                      control=list(ptypes=c(0.75,0.25),nrep=nr,nverb=nv))
   if(interactive()) plot(X1.straussm)
   
   # Multitype Strauss conditioning upon the total number
   # of points being 80:
   X2.straussm <- rmh(model=mod08,start=list(n.start=ns),
                      control=list(p=1,ptypes=c(0.75,0.25),nrep=nr,
                                   nverb=nv))
   
   # Conditioning upon the number of points of type 1 being 60
   # and the number of points of type 2 being 20:
   X3.straussm <- rmh(model=mod08,start=list(n.start=c(60,20)),
                      control=list(fixall=TRUE,p=1,ptypes=c(0.75,0.25),
                                   nrep=nr,nverb=nv))
   
   # Multitype Strauss hardcore:
   rhc  <- matrix(c(9.1,5.0,5.0,2.5),2,2)
   mod09 <- list(cif="straushm",par=list(beta=beta,gamma=gmma,
                iradii=r,hradii=rhc),w=c(0,250,0,250))
   X.straushm <- rmh(model=mod09,start=list(n.start=ns),
                     control=list(ptypes=c(0.75,0.25),nrep=nr,nverb=nv))
   
   # Multitype Strauss hardcore with trends for each type:
   beta  <- c(0.27,0.08)
   tr3   <- function(x,y){x <- x/250; y <- y/250;
   			   exp((6*x + 5*y - 18*x^2 + 12*x*y - 9*y^2)/6)
                         }
                         # log quadratic trend
   tr4   <- function(x,y){x <- x/250; y <- y/250;
                         exp(-0.6*x+0.5*y)}
                        # log linear trend
   mod10 <- list(cif="straushm",par=list(beta=beta,gamma=gmma,
                 iradii=r,hradii=rhc),w=c(0,250,0,250),
                 trend=list(tr3,tr4))
   X1.straushm.trend <- rmh(model=mod10,start=list(n.start=ns),
                            control=list(ptypes=c(0.75,0.25),
                            nrep=nr,nverb=nv))
   if(interactive()) plot(X1.straushm.trend)
   
   # Multitype Strauss hardcore with trends for each type, given as images:
   bigwin <- square(250)
   i1 <- as.im(tr3, bigwin)
   i2 <- as.im(tr4, bigwin)   
   mod11 <- list(cif="straushm",par=list(beta=beta,gamma=gmma,
                 iradii=r,hradii=rhc),w=bigwin,
                 trend=list(i1,i2))
   X2.straushm.trend <- rmh(model=mod11,start=list(n.start=ns),
                            control=list(ptypes=c(0.75,0.25),expand=1,
                            nrep=nr,nverb=nv))
   
   # Diggle, Gates, and Stibbard:
   mod12 <- list(cif="dgs",par=list(beta=3600,rho=0.08),w=c(0,1,0,1))
   X.dgs <- rmh(model=mod12,start=list(n.start=ns),
                control=list(nrep=nr,nverb=nv))
   if(interactive()) plot(X.dgs)
   
   # Diggle-Gratton:
   mod13 <- list(cif="diggra",
                 par=list(beta=1800,kappa=3,delta=0.02,rho=0.04),
                 w=square(1))
   X.diggra <- rmh(model=mod13,start=list(n.start=ns),
                   control=list(nrep=nr,nverb=nv))
   if(interactive()) plot(X.diggra)
   
   # Fiksel:
   modFik <- list(cif="fiksel",
                 par=list(beta=180,r=0.15,hc=0.07,kappa=2,a= -1.0),
                 w=square(1))
   X.fiksel <- rmh(model=modFik,start=list(n.start=ns),
                   control=list(nrep=nr,nverb=nv))
   if(interactive()) plot(X.fiksel)
   
   # Geyer:
   mod14 <- list(cif="geyer",par=list(beta=1.25,gamma=1.6,r=0.2,sat=4.5),
                 w=c(0,10,0,10))
   X1.geyer <- rmh(model=mod14,start=list(n.start=ns),
                   control=list(nrep=nr,nverb=nv))
   if(interactive()) plot(X1.geyer)
   
   # Geyer; same as a Strauss process with parameters
   # (beta=2.25,gamma=0.16,r=0.7):
   
   mod15 <- list(cif="geyer",par=list(beta=2.25,gamma=0.4,r=0.7,sat=10000),
                 w=c(0,10,0,10))
   X2.geyer <- rmh(model=mod15,start=list(n.start=ns),
                   control=list(nrep=nr,nverb=nv))
   
   mod16 <- list(cif="geyer",par=list(beta=8.1,gamma=2.2,r=0.08,sat=3))
   data(redwood)
   X3.geyer <- rmh(model=mod16,start=list(x.start=redwood),
                   control=list(periodic=TRUE,nrep=nr,nverb=nv))
   
   # Geyer, starting from the redwood data set, simulating
   # on a torus, and conditioning on n:
   X4.geyer <- rmh(model=mod16,start=list(x.start=redwood),
                   control=list(p=1,periodic=TRUE,nrep=nr,nverb=nv))

   # Lookup (interaction function h_2 from page 76, Diggle (2003)):
      r <- seq(from=0,to=0.2,length=101)[-1] # Drop 0.
      h <- 20*(r-0.05)
      h[r<0.05] <- 0
      h[r>0.10] <- 1
      mod17 <- list(cif="lookup",par=list(beta=4000,h=h,r=r),w=c(0,1,0,1))
      X.lookup <- rmh(model=mod17,start=list(n.start=ns),
                      control=list(nrep=nr,nverb=nv))
      if(interactive()) plot(X.lookup)
                   
   # Strauss with trend
   tr <- function(x,y){x <- x/250; y <- y/250;
   			   exp((6*x + 5*y - 18*x^2 + 12*x*y - 9*y^2)/6)
                         }
   beta <- 0.3
   gmma <- 0.5
   r    <- 45
   modStr <- list(cif="strauss",par=list(beta=beta,gamma=gmma,r=r),
                 w=square(250), trend=tr)
   X1.strauss.trend <- rmh(model=modStr,start=list(n.start=ns),
                           control=list(nrep=nr,nverb=nv))
   # Baddeley-Geyer
   r <- seq(0,0.2,length=8)[-1]
   gmma <- c(0.5,0.6,0.7,0.8,0.7,0.6,0.5)
   mod18 <- list(cif="badgey",par=list(beta=4000, gamma=gmma,r=r,sat=5),
                 w=square(1))
   X1.badgey <- rmh(model=mod18,start=list(n.start=ns),
                    control=list(nrep=nr,nverb=nv))
   mod19 <- list(cif="badgey",
                 par=list(beta=4000, gamma=gmma,r=r,sat=1e4),
                 w=square(1))
   set.seed(1329)
   X2.badgey <- rmh(model=mod18,start=list(n.start=ns),
                    control=list(nrep=nr,nverb=nv))

   # Check:
   h <- ((prod(gmma)/cumprod(c(1,gmma)))[-8])^2
   hs <- stepfun(r,c(h,1))
   mod20 <- list(cif="lookup",par=list(beta=4000,h=hs),w=square(1))
   set.seed(1329)
   X.check <- rmh(model=mod20,start=list(n.start=ns),
                      control=list(nrep=nr,nverb=nv))
   # X2.badgey and X.check will be identical.

   mod21 <- list(cif="badgey",par=list(beta=300,gamma=c(1,0.4,1),
                 r=c(0.035,0.07,0.14),sat=5), w=square(1))
   X3.badgey <- rmh(model=mod21,start=list(n.start=ns),
                    control=list(nrep=nr,nverb=nv))
   # Same result as Geyer model with beta=300, gamma=0.4, r=0.07,
   # sat = 5 (if seeds and control parameters are the same)

   # Or more simply:
   mod22 <- list(cif="badgey",
                 par=list(beta=300,gamma=0.4,r=0.07, sat=5),
                 w=square(1))
   X4.badgey <- rmh(model=mod22,start=list(n.start=ns),
                    control=list(nrep=nr,nverb=nv))
   # Same again --- i.e. the BadGey model includes the Geyer model.


   # Illustrating scalability.
   ## Not run: 
##D     M1 <- rmhmodel(cif="strauss",par=list(beta=60,gamma=0.5,r=0.04),w=owin())
##D     set.seed(496)
##D     X1 <- rmh(model=M1,start=list(n.start=300))
##D     M2 <- rmhmodel(cif="strauss",par=list(beta=0.6,gamma=0.5,r=0.4),
##D               w=owin(c(0,10),c(0,10)))
##D     set.seed(496)
##D     X2  <- rmh(model=M2,start=list(n.start=300))
##D     chk <- affine(X1,mat=diag(c(10,10)))
##D     all.equal(chk,X2,check.attributes=FALSE)
##D     # Under the default spatstat options the foregoing all.equal()
##D     # will yield TRUE.  Setting spatstat.options(scalable=FALSE) and
##D     # re-running the code will reveal differences between X1 and X2.
##D    
## End(Not run)

   if(!interactive()) spatstat.options(oldopt)



