library(TreeSimGM)


### Name: sim.age
### Title: Simulating General Model Trees on Age
### Aliases: sim.age
### Keywords: general model phylogenetic trees phylogenies simulation
###   macroevolution shift model

### ** Examples


## example 1 ##

# Simulation of one tree with age 3 with a symmetric speciation mode, 
# a Weibull disribution for the waiting time until speciation, 
# and without extinction 

sim.age(3,1,"rweibull(0.4,3)")


## example 2 ##

# Plot one of ten simulated trees under symmetric speciation mode, with
# a uniform distribution for the waiting time to speciation and 
# an exponential distribution for the waiting time to extinction

my3s <- sim.age(age=3,numbsim=10,"runif(0.5,2)", "rexp(0.1)")

# note that for runif, the first argument is omitted and 0 stands for the
# minimum parameter of this specific function and 2 stands for the maximum

plot(my3s[[1]])


## example 3 ##

# Simulating trees with changes in the waiting time to speciation and extinction.
# The probability for a change of speciation / extinction in a new species 
# is 0.1. Upon a change in speciation, the speciation time is scaled by a factor 
# drawn from a normal distribution with mean 0.5 and sd of 0.05. This implies that 
# changes shorten the time to speciation.
# Changes in extinction are normally distributed with mean of 1.5, 
# leading to extended time to extinction

shif_spext_sym <- sim.age(age=2, numbsim=5,  waitsp="rexp(1)", waitext="rexp(0.5)", 
symmetric = TRUE, shiftsp=list(prob=0.1, strength="rnorm(0.5,0.05)"),
shiftext=list(prob=0.1, strength="rnorm(1.5,0.05)"))


## example 4 ##

# Simulating trees under an asymmetric speciation mode with changes on extinction waiting times

set.seed(10)
shif_ext_asym <- sim.age(age=2, numbsim=3, waitsp="rexp(0.8)", waitext="rexp(0.5)", 
symmetric = FALSE, shiftsp=list(prob=0.1, strength="rnorm(0.7,0.9)"), 
shiftext=list(prob=0.05, strength="runif(0.4,0.5)"))


## example 5 ##

# Simulating trees using own functions instead of strings as waiting times input
# first simulating a similar tree to example 4

set.seed(10)
shif_ext_asym_funk <- sim.age(age=2, numbsim=3, waitsp=function()rexp(1,0.8), 
waitext=function()rexp(1,0.5), 
symmetric = FALSE, shiftsp=list(prob=0.1, strength=function()rnorm(1,0.7,0.9)), 
shiftext=list(prob=0.05, strength=function()runif(1,0.4,0.5)))

# test if results are identical...
identical(shif_ext_asym, shif_ext_asym_funk)

# Now we will generate a tree based on own defined waiting time rules! only one shift 
# strength for speciation.
# In our waiting time function, we choose have exponentialy distributed waiting times 
# until speciation that are limit to be at least 0.5! 
# if they are smaller than 0.5, the waiting time will be 0.5
# remember that this function need to generate one single number.
waitspfunk <- function() {
  wt=rexp(1,1.5) 
  if(wt<0.5){wt=0.5} 
  return(wt)
}
set.seed(86)
# now we plug in our function or define it directly...
funk_tree <- sim.age(age=4, numbsim=3, waitsp=waitspfunk, 
waitext=function()rexp(1,0.9), shiftsp=list(prob=0.1, strength=function()0.5))
plot(funk_tree[[1]])


## example 6 ##

# Validation of sim.age using TreePar: 
# estimating parameters for the speciation and extinction distribution
# based on simulated trees using exponential waiting times to speciation and gamma distributed 
# (i.e. age-dependent) waiting times to extinction under an asymmetric speciation mode
## Not run: 
##D  
##D sp_la <- 3
##D ext_shape <- 3
##D ext_scale <- 2
##D treesTreeSimGM <- sim.age(2, 10, waitsp=paste0("rexp(",sp_la,")"), 
##D waitext=paste0("rgamma(",ext_shape,",",ext_scale,")"), complete=TRUE )
##D sptimes <- lapply(treesTreeSimGM, function(x) if  (class(x)=="phylo") getx(x))
##D require(TreePar) #please read TreePar documentation for installation instructions. 
##D ** This requires Matlab or at 
##D ** least Matlab runtime installation.
##D setwd("C:/YourPathToTreePar/TreePar-Matlab")
##D yourpath to matlab runtime
##D math_run_path <- 'C:/Program Files/MATLAB/MATLAB Runtime/v91/runtime/win64/' 
##D out <- create.mat(sptimes[[1]],path=math_run_path)
##D bd_out <- bd.age.optim.matlab(sptimes[[1]],path=math_run_path, sampling=1,
##D lambdainit=0.5,kinit=3,thetainit=0.7,
##D numgridpts=500)
##D Lcond <- "C"
##D lambdainit = 1
##D kinit = 1
##D thetainit = 0.5
##D sampling = 1
##D model = "G"
##D precision = 4
##D matfilename = "setup"
##D Param <- paste("'", lambdainit, kinit, thetainit, "'")
##D 
##D runCmd <- paste("sh ./run_MaxLFcn.sh ", math_run_path, matfilename, "outputML", 
##D                as.character(precision), Lcond, model, Param, as.character(sampling), 
##D                sep = " ")
##D system(runCmd)
## End(Not run)

## example 7 ##

# Validation of sim.age using TreeSim:
# trees under exponentially distributed waiting times to speciation and extinction are simulated

la=1
mu=0.5

library(TreeSim)
treesTreeSim <- sim.bd.age(2, numbsim=1000, lambda=la, mu=mu, mrca = FALSE, complete = TRUE, K = 0)
library(TreeSimGM)
treesTreeSimGM <- sim.age(2, numbsim=1000, waitsp=paste0("rexp(",la,")"),
waitext=paste0("rexp(",mu,")") )
# treesTreeSim and treesTreeSimGM have the same underlying assunptions

## compare for number of tips
# get number of tips
tipsSimTree <- unlist(lapply(treesTreeSim, function(x) if  (class(x)=="phylo") length(x[[2]])))
tipsSimTreeGM <- unlist(lapply(treesTreeSimGM, function(x) if  (class(x)=="phylo") length(x[[2]])))
# make final list
finallist <- list(SimTree=tipsSimTree, SimTreeGM=tipsSimTreeGM)
# plot
boxplot(finallist, ylab="# of tips")

## compare for oldest branching events
# get oldest branching events
branchSimTree <- unlist(lapply(treesTreeSim, function(x) if  (class(x)=="phylo") max(x[[3]])))
branchSimTreeGM <- unlist(lapply(treesTreeSimGM, function(x) if  (class(x)=="phylo") max(x[[3]])))
# make final list
finallist <- list(SimTree=branchSimTree, SimTreeGM=branchSimTreeGM)
# plot
boxplot(finallist, ylab="oldest branching events")




