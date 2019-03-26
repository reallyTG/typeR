library(IPEC)


### Name: bootIPEC
### Title: Bootstrap Function for Nonlinear Regression
### Aliases: bootIPEC

### ** Examples

#### Example 1 #################################################################################
graphics.off()
# The velocity of the reaction (counts/min^2) under different substrate concentrations 
#   in parts per million (ppm) (Page 269 of Bates and Watts 1988)

x1 <- c(0.02, 0.02, 0.06, 0.06, 0.11, 0.11, 0.22, 0.22, 0.56, 0.56, 1.10, 1.10)
y1 <- c(76, 47, 97, 107, 123, 139, 159, 152, 191, 201, 207, 200)

# Define the Michaelis-Menten (MM) model
MM <- function(theta, x){
    theta[1]*x / ( theta[2] + x )    
}

## Not run: 
##D   res4 <- bootIPEC( MM, x=x1, y=y1, ini.val=c(200, 0.05), target.fun = "RSS", 
##D                     control=list(reltol=1e-20, maxit=40000), nboot=2000, alpha=0.05, 
##D                     fig.opt=TRUE, seed=123 )
##D   res4
## End(Not run)
#################################################################################################


#### Example 2 ##################################################################################
graphics.off()
# Development data of female pupae of cotton bollworm (Wu et al. 2009)
# References:
#   Ratkowsky, D.A. and Reddy, G.V.P. (2017) Empirical model with excellent statistical 
#       properties for describing temperature-dependent developmental rates of insects  
#       and mites. Ann. Entomol. Soc. Am. 110, 302-309.
#   Wu, K.-J., Gong, P.-Y. and Ruan, Y.-M. (2009) Estimating developmental rates of 
#       Helicoverpa armigera (Lepidoptera: Noctuidae) pupae at constant and
#       alternating temperature by nonlinear models. Acta Entomol. Sin. 52, 640-650.

# 'x2' is the vector of temperature (in degrees Celsius)
# 'D2' is the vector of developmental duration (in d)
# 'y2' is the vector of the square root of developmental rate (in 1/d)

x2 <- seq(15, 37, by=1)
D2 <- c(41.24,37.16,32.47,26.22,22.71,19.01,16.79,15.63,14.27,12.48,
       11.3,10.56,9.69,9.14,8.24,8.02,7.43,7.27,7.35,7.49,7.63,7.9,10.03)
y2 <- 1/D2
y2 <- sqrt( y2 )
ini.val1 <- c(0.14, 30, 10, 40)

# Define the square root function of the Lobry-Rosso-Flandrois (LRF) model
sqrt.LRF <- function(P, x){
  ropt <- P[1]
  Topt <- P[2]
  Tmin <- P[3]
  Tmax <- P[4]
  fun0 <- function(z){
    z[z < Tmin] <- Tmin
    z[z > Tmax] <- Tmax
    return(z)
  }
  x <- fun0(x)
  sqrt( ropt*(x-Tmax)*(x-Tmin)^2/((Topt-Tmin)*((Topt-Tmin
      )*(x-Topt)-(Topt-Tmax)*(Topt+Tmin-2*x))) )
}

myfun <- sqrt.LRF
## Not run: 
##D   resu4 <- bootIPEC( myfun, x=x2, y=y2, ini.val=ini.val1, target.fun="RSS", 
##D                      nboot=2000, alpha=0.05, fig.opt=TRUE, seed=123 )
##D   resu4
## End(Not run)
#################################################################################################


#### Example 3 ##################################################################################
graphics.off()
# Height growth data of four species of bamboos (Gramineae: Bambusoideae)
# Reference(s):
# Shi, P.-J., Fan, M.-L., Ratkowsky, D.A., Huang, J.-G., Wu, H.-I, Chen, L., Fang, S.-Y. and  
#     Zhang, C.-X. (2017) Comparison of two ontogenetic growth equations for animals and plants. 
#     Ecol. Model. 349, 1-10.

data(shoots)
attach(shoots)
# Choose a species
# 1: Phyllostachys iridescens; 2: Phyllostachys mannii; 
# 3: Sinobambusa tootsik; 4: Pleioblastus maculatus
# 'x3' is the vector of the observation times from a specific starting time of growth
# 'y3' is the vector of the aboveground height values of bamboo shoots at 'x3' 

ind <- 2
x3  <- time[code == ind]
y3  <- height[code == ind] 

# Define the beta sigmoid model (bsm)
bsm <- function(P, x){
  P  <- cbind(P)
  if(length(P) !=4 ) {stop(" The number of parameters should be 4!")}
  ropt <- P[1]
  topt <- P[2]
  tmin <- P[3]
  tmax <- P[4]
  tailor.fun <- function(x){
    x[x < tmin] <- tmin
    x[x > tmax] <- tmax
    return(x)
  }
  x <- tailor.fun(x)   
  return(ropt*(x-tmin)*(x-2*tmax+topt)/(topt+tmin-
         2*tmax)*( (x-tmin)/(topt-tmin) )^((topt-tmin)/(tmax-topt)))   
}

# Define the simplified beta sigmoid model (simp.bsm)
simp.bsm <- function(P, x, tmin=0){
  P  <- cbind(P)  
  ropt  <- P[1]
  topt  <- P[2]
  tmax  <- P[3]
  tailor.fun <- function(x){
    x[x < tmin] <- tmin
    x[x > tmax] <- tmax
    return(x)
  }
  x <- tailor.fun(x)   
  return(ropt*(x-tmin)*(x-2*tmax+topt)/(topt+tmin-
         2*tmax)*((x-tmin)/(topt-tmin) )^((topt-tmin)/(tmax-topt)))   
}

# For the original beta sigmoid model
ini.val2 <- c(40, 30, 5, 50)
xlab2    <- "Time (d)"
ylab2    <- "Height (cm)"

## Not run: 
##D   re4 <- bootIPEC( bsm, x=x3, y=y3, ini.val=ini.val2, target.fun = "RSS", 
##D                    control=list(trace=FALSE, reltol=1e-20, maxit=50000),
##D                    nboot=2000, alpha=0.05, fig.opt=TRUE, fold=10, seed=123 )
##D   re4
## End(Not run)

# For the simplified beta sigmoid model (in comparison with the original beta sigmoid model)
ini.val7 <- c(40, 30, 50)

## Not run: 
##D   RESU4 <- bootIPEC( simp.bsm, x=x3, y=y3, ini.val=ini.val7, target.fun = "RSS", 
##D                      control=list(trace=FALSE, reltol=1e-20, maxit=50000),
##D                      nboot=2000, alpha=0.05, fig.opt=TRUE, fold=10, seed=123 )
##D   RESU4
## End(Not run)
#################################################################################################


#### Example 4 ##################################################################################
graphics.off()
# Weight of cut grass data (Pattinson 1981)
# References:
#   Clarke, G.P.Y. (1987) Approximate confidence limits for a parameter function in nonlinear 
#       regression. J. Am. Stat. Assoc. 82, 221-230.
#   Gebremariam, B. (2014) Is nonlinear regression throwing you a curve? 
#       New diagnostic and inference tools in the NLIN Procedure. Paper SAS384-2014. 
#       http://support.sas.com/resources/papers/proceedings14/SAS384-2014.pdf
#   Pattinson, N.B. (1981) Dry Matter Intake: An Estimate of the Animal
#       Response to Herbage on Offer. unpublished M.Sc. thesis, University
#       of Natal, Pietermaritzburg, South Africa, Department of Grassland Science.

# 'x4' is the vector of weeks after commencement of grazing in a pasture
# 'y4' is the vector of weight of cut grass from 10 randomly sited quadrants

x4 <- 1:13
y4 <- c( 3.183, 3.059, 2.871, 2.622, 2.541, 2.184, 
         2.110, 2.075, 2.018, 1.903, 1.770, 1.762, 1.550 )

# Define the first case of Mitscherlich equation
MitA <- function(P1, x){
    P1[3] + P1[2]*exp(P1[1]*x)
}

# Define the second case of Mitscherlich equation
MitB <- function(P2, x){
    log( P2[3] ) + exp(P2[2] + P2[1]*x)
}

# Define the third case of Mitscherlich equation
MitC <- function(P3, x, x1=1, x2=13){
    theta1 <- P3[1]
    beta2  <- P3[2]
    beta3  <- P3[3]
    theta2 <- (beta3 - beta2)/(exp(theta1*x2)-exp(theta1*x1))
    theta3 <- beta2/(1-exp(theta1*(x1-x2))) - beta3/(exp(theta1*(x2-x1))-1)
    theta3 + theta2*exp(theta1*x)
}

## Not run: 
##D   ini.val3 <- c(-0.1, 2.5, 1.0)
##D   r4       <- bootIPEC( MitA, x=x4, y=y4, ini.val=ini.val3, target.fun="RSS", 
##D                         nboot=2000, alpha=0.05, fig.opt=TRUE, seed=123 )
##D   r4
##D 
##D   ini.val4 <- c(exp(-0.1), log(2.5), 1)
##D   R4       <- bootIPEC( MitB, x=x4, y=y4, ini.val=ini.val4, target.fun="RSS", 
##D                         nboot=2000, alpha=0.05, fig.opt=TRUE, seed=123 )
##D   R4
##D 
##D   # ini.val6 <- c(-0.15, 2.52, 1.09)
##D   iv.list2 <- list(seq(-2, -0.05, len=5), seq(1, 4, len=8), seq(0.05, 3, by=0.5))
##D   RES0 <- fitIPEC( MitC, x=x4, y=y4, ini.val=iv.list2, target.fun="RSS", 
##D                    control=list(trace=FALSE, reltol=1e-10, maxit=5000) )
##D   RES0$par
##D   RES4 <- bootIPEC( MitC, x=x4, y=y4, ini.val=iv.list2, target.fun="RSS", 
##D                     control=list(trace=FALSE, reltol=1e-10, maxit=5000), 
##D                     nboot=5000, alpha=0.05, fig.opt=TRUE, fold=3.5, seed=123, unique.num=2 )
##D   RES4
## End(Not run)
#################################################################################################



