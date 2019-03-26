library(TreeSimGM)


### Name: sim.taxa
### Title: Simulating General Model Trees on a fixed number of extant Taxa
### Aliases: sim.taxa
### Keywords: general model phylogenetic trees phylogenies simulation
###   macroevolution shift model

### ** Examples

## example 1 ##

# Simulating trees under a Weibull distributed time to speciation, no extinction,
# and using a symmetric speciation mode. The simulation is stopped once 10 co-existing species
# exist for the first time (gsa = FALSE).

my3 <- sim.taxa(1, n=10, waitsp="rweibull(1.5,1)",
symmetric=TRUE, complete=TRUE, tiplabel=c("tip", "tip" ,"", ""))

plot(my3[[1]])


## example 2 ##

# Trees are simulated using gsa=TRUE with an exponential distribution for 
# speciation and extinction

## Not run: 
##D  
##D ** long runing timce since gsa=TRUE **
##D mytree <-  sim.taxa(numbsim=10, n=10, m=15,  waitsp="rexp(1.5)",
##D waitext="rexp(0.1)",symmetric = TRUE, complete=TRUE, 
##D tiplabel=c("sp.", "ext.", NA, NA), sampling.gsa=2, gsa=TRUE)
## End(Not run)

## example 3 ##

# Now changes in speciation waiting times occur in new species with 
# probability 0.1, again under a symmetric mode

shift_sp_sym <- sim.taxa(numbsim=10, n=10, waitsp="rexp(1)", 
waitext="rexp(0.5)", symmetric = TRUE, shiftsp=list(prob=0.1, strength="runif(0.5,0.9)"))


## example 4 ##

# Simulations under an asymmetric speciation mode with changes in 
# speciation and extinction waiting times

shif_spext_asym <- sim.taxa(numbsim=10, n=10, waitsp="rexp(1)", 
waitext="rexp(0.5)", symmetric = FALSE, shiftsp=list(prob=0.1, strength="runif(0.5,0.9)"), 
shiftext=list(prob=0.05, strength="runif(0,0.5)"))

## example 5 ##

# Waiting times as functions instead of strings, allowing for more flexibility
t1 <- sim.taxa(1,8, waitsp="rnorm(0.5,0)")
plot(t1[[1]])
t2 <- sim.taxa(1,8, waitsp=function() rnorm(1,0.5,0))
plot(t2[[1]])
identical(t1,t2)
t3 <- sim.taxa(1,8, waitsp=function() 0.5)
plot(t3[[1]])
identical(t1,t3)
# all implementations are identical!

# Creating own function for waitsp and shiftsp
waitspfunk <- function() {
  wt=rexp(1,1.5) 
  if(wt>1.5){wt=20} 
  return(wt)
}
# here we force all values bigger than 1.5 to be very large, i.e. 20
set.seed(13)
tshittfunk <- sim.taxa(1,10, waitsp=waitspfunk, 
shiftsp=list(prob=0.2, strength=function()sample(c(0.05,0.5,0.9), 1) ))
plot(tshittfunk [[1]])






