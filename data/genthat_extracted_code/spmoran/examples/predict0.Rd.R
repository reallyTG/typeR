library(spmoran)


### Name: predict0
### Title: Spatial prediction using eigenvector spatial filtering (ESF) or
###   random effects ESF
### Aliases: predict0

### ** Examples

require(spdep)
data(boston)
samp    <- sample( dim( boston.c )[ 1 ], 300)

d       <- boston.c[ samp, ]  ## Data at observed sites
y	      <- d[, "CMEDV"]
x       <- d[,c("ZN","INDUS", "NOX","RM", "AGE", "DIS")]
coords  <- d[,c("LAT","LON")]

d0      <- boston.c[-samp, ]  ## Data at unobserved sites
x0      <- d0[,c("ZN","INDUS", "NOX","RM", "AGE", "DIS")]
coords0 <- d0[,c("LAT","LON")]

############ Model estimation
meig 	  <- meigen( coords = coords )
mod	    <- resf(y=y,x=x,meig=meig)
## or
# mod   <- esf(y=y,x=x,meig=meig)

############ Spatial prediction
meig0 	<- meigen0( meig = meig, coords0 = coords0 )
pred0   <- predict0( mod = mod, x0 = x0, meig0 = meig0 )
pred0[1:10,]



