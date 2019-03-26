library(RandomFields)


### Name: S10
### Title: On some covariance models based on normal scale mixtures
### Aliases: S10
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

### Example 10 in Schlather (2010).
## The field below has more than 80 million points. So the simulation
## takes a while
y <- x <- seq(0, 10, len=256) ## currently does not work
T <- c(0, 0.02, 1275)
col <- c(topo.colors(300)[1:100], cm.colors(300)[c((1:50) * 2,
         101:150)])
y <- x <- seq(0, 10, len=5)
T <- c(0, 0.02, 4)
model <- RMcoxisham(mu=c(1, 1), D=matrix(nr=2, c(1, 0.5, 0.5, 1)),
                    RMwhittle(nu=1))
z <- RFsimulate(model, x, y, T=T, sp_lines=1500, every=10)
plot(z, MARGIN.slices=3, col=col)
plot(z, MARGIN.movie=3) # add 'file="ci.avi"' to get it stored


## Don't show: ## Not run: 
##D ### Example 13 in Schlather (2010)
##D y <- x <- seq(0, 10,len = 256)
##D T <- c(0, 0.02, 1275)
##D col <- c(topo.colors(300)[1:100], cm.colors(300)[c((1:50) * 2, 101:150)]) 
##D \dontshow{if(RFoptions()$internal$examples_red){warning("reduced x,y,T"); 
##D y <- x <- seq(0, 10,len = 10) 
##D T <- c(0, 0.02, 4)
##D }}
##D model <- RMave(A = matrix(nc=2,c(0.5, 0, 0, 1)), z= c(2,0),
##D                RMwhittle(nu=1))
##D z <- RFsimulate(model, x, y, T=T, every = 10,
##D                 trials=2, force=TRUE, maxmem=16777216*8)
##D plot(z)
## End(Not run)## End(Don't show)

## Don't show: ## Not run: 
##D basicname <- "moving"
##D Plot(basicname, x, y, z, col=col, T=T)
##D save(file=paste(basicname, "/", basicname, ".dat", sep=""), z) # OK
## End(Not run)## End(Don't show)


## Don't show: ## Not run: 
##D 
##D ### Example 16 in Schlather (2010)
##D intens <- 1000 ## takes a huge amount of time; take smaller values
##D len <- 81
##D \dontshow{if(RFoptions()$internal$examples_red){warning("modified intens & len");intens<-3;len<-4}}
##D y <- x <- seq(-3, 3, len=len)
##D T <- seq(0, 0.075, len=len)
##D col <- c(topo.colors(300)[1:100], cm.colors(300)[c((1:50) * 2,
##D 101:150)])
##D \dontshow{if(RFoptions()$internal$examples_red){warning("reduced 'intens'"); intens<-3}}
##D model <- RMstp(M=matrix(nc=3, rep(0, 9)),
##D                S=RMetaxxa(E=c(1, 1, 1), alpha = -2 * pi,
##D                           A=t(matrix(nc=3, c(2, 0, 0, 1, 1 , 0, 0, 0, 0)))),
##D                Aniso = RMrotation(phi= -2 * pi),
##D                phi = RMwhittle(nu = 1) )
##D z <- RFsimulate(model, x, x, z=T, me="coin", every = 10, 
##D  mpp.intens=intens, mpp.p = 0.1, mpp.beta=3.5, mpp.plus = 8, print=3) 
##D zlim <- c(-3.5, 3.5)
##D time <- dim(z)[3]
##D for (i in 1:time) {Print(i);image(x, y, z[,,i], add=i>1, col=col, zlim=zlim)}
##D 
## End(Not run)## End(Don't show)

## Don't show: ## Not run: 
##D basicname <- "cyclone"
##D Plot(basicname, x, y, z, col=col, T=T, pixels=256, zi=0.5 + dim(z)[2]/2,
##D  speed=0.2, zlim=zlim)
##D save(file=paste(basicname, "/", basicname, ".dat", sep=""), z) # OK
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


