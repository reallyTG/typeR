library(spmoran)


### Name: predict0_vc
### Title: Prediction of explained variables and spatially varying
###   coefficients
### Aliases: predict0_vc

### ** Examples

require(spdep)
data(boston)
samp    <- sample( dim( boston.c )[ 1 ], 300)

d       <- boston.c[ samp, ]    ## Data at observed sites
y	      <- d[, "CMEDV"]
x       <- d[,c("CRIM", "ZN", "INDUS", "RM" ,"LSTAT")]
xconst  <- d[,c("NOX", "CHAS", "AGE", "DIS", "RAD", "TAX", "PTRATIO", "B" )]
coords  <- d[,c("LAT","LON")]

d0      <- boston.c[-samp, ]    ## Data at unobserved sites
x0      <- d0[,c("CRIM", "ZN", "INDUS", "RM" ,"LSTAT")]
xconst0 <- d0[,c("NOX", "CHAS", "AGE", "DIS", "RAD", "TAX", "PTRATIO", "B" )]
coords0 <- d0[,c("LAT","LON")]

############ Model estimation
meig 	  <- meigen( coords = coords )
mod	    <- resf_vc(y=y, x=x, xconst=xconst, meig=meig)

############ Spatial prediction of y and spatially varying coefficients
meig0 	<- meigen0( meig = meig, coords0 = coords0 )
pred0   <- predict0_vc( mod = mod, x0 = x0, xconst0=xconst0, meig0 = meig0 )
pred0$pred[1:10,]
pred0$b_vc[1:10,]
pred0$bse_vc[1:10,]
pred0$t_vc[1:10,]
pred0$p_vc[1:10,]

############ or spatial prediction of spatially varying coefficients
pred00  <- predict0_vc( mod = mod, meig0 = meig0 )
pred00$b_vc[1:10,]
pred00$bse_vc[1:10,]
pred00$t_vc[1:10,]
pred00$p_vc[1:10,]



