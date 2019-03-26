library(UWHAM)


### Name: uwham
### Title: Unbinned weighted histogram analysis method (UWHAM) for
###   estimating free energies
### Aliases: uwham
### Keywords: free energy

### ** Examples

#######################################
############## example 1 ##############  
#######################################

# This example illustrates the calculation of the standard free energy
# of binding of a ligand to a protein receptor by means of an alchemical
# perturbation potential of the form lambda*binding_energy(r), where
# lambda is a scaling parameter (lambda=0 corresponds to the
# protein-ligand uncoupled state, and lambda=1 corresponds to the
# coupled state) and binding_energy(r) is the (solvent averaged)
# potential energy of conformation r of the complex relative to one in
# which the receptor and the ligand are rigidly displaced at infinite
# separation. See Gallicchio et al., J. Chem. Theory Comput. 6,
# 2961-2977 (2010), and Tan et al. J. Chem. Phys., 136, 144102 (2012).

# Inverse temperature beta, in kcal/mol^-1
bet <- 1.0/(0.001986209*300.0)

# negative reduced potential function -beta*lambda*binding_energy.
#  "x" is the binding energy of a structure of the complex and "lam" the
#  value of lambda at which to compute the reduced energy
npot.fcn <- function(x, lam)
   -bet*lam*x

# values of lambda for the calculation with a "hard-core" potential 
lam <- c(0.0, 0.000000001, 0.00000001, 0.0000001, 0.000001, 0.00001, 0.0001,
         0.001, 0.01, 0.1, 0.15, 0.25, 0.35, 0.5, 0.6, 0.75, 0.9, 1.0)

#number of alchemical states
m <- length(lam)

# load binding energies
data(ligand2.hard)
lig.data <- ligand2.hard$V1

# 1000 observations at each lambda state
size <- rep(1000, m)

# total sample size
N <- sum(size)

# compute negative potential of each observation at each lambda state
neg.pot <- matrix(0, N,m)
for (j in 1:length(lam))
  neg.pot[,j] <- npot.fcn(x=lig.data, lam=lam[j])

# estimate free energies using UWHAM
out <- uwham(logQ=neg.pot, size=size, fisher=TRUE)

# convergence diagnosis: the elements should be equal to 1 
out$check

# the "ze" values are dimensionless free energies, that is the
# log of the partition functions (log Z). 
# To obtain thermodynamic free energies, multiply by -kT.
# 0.71 kcal/mol is the standard state correction; see
# Lapelosa et al. J Chem Theory Comput, 8, 44-60 (2012).
-out$ze/bet + 0.71

# variances of free energies from Fisher information
sqrt(out$ve)/bet

# perform block bootstrap for free energies to take into account
# time correlations in the binding energy data
# To save time for package checking, this is not run.
#out.boot <- uwham.boot(proc.type="parallel", block.size=50, boot.size=100, 
#                       logQ=neg.pot, size=size)
#
#-out.boot$ze/bet + 0.71
#sqrt(out.boot$ve)/bet

# estimation of average binding energies and variances 
# at lambda = 0.6, 0.75, 0.9, 1.0
state <- 15:18
out.phi <- uwham.phi(phi=lig.data, state=state, out.uwham=out, fisher=TRUE)

out.phi$phi
out.phi$phi.v 

# block bootstrap for both free energies and expectations
# To save time for package checking, this is not run.
#out.boot <- uwham.boot(proc.type="parallel", block.size=50, boot.size=100, 
#                       logQ=neg.pot, size=size, 
#                       phi=lig.data, state=state)
#
#out.boot$phi
#out.boot$phi.v

################################################
## example 2 (unequal and zero sample sizes) ###
################################################

# same calculation as above but with a "soft-core" potential and
# illustrating the ability to compute free energies and expectations
# for states with unequal sample sizes including those with
# zero sample sizes (or states that have not been sampled).
# See Tan et al. J. Chem. Phys., 136, 144102 (2012).

rm(list=ls())

# inverse temperature
bet <- 1.0/(0.001986209*300.0)

# negative potential function 
npot.fcn <- function(x, lam)
   -bet*lam*x

# read data (soft core)
lam <- c(0.0, 0.001, 0.002, 0.004, 0.006, 0.008, 0.01, 0.02, 0.06, 0.1,
         0.25, 0.5, 0.75, 0.9, 1.0)
m <- length(lam)

data(ligand2.soft)
lig.data <- ligand2.soft$V1

### unequal and zero sample sizes
size <- c( rep(1000, 5), rep(500, 3), rep(0, 2), rep(1000,5))
subs <- c(rep(TRUE, 5000), rep(c(rep(TRUE,500),rep(FALSE,500)), 3),
          rep(FALSE, 2000), rep(TRUE,5000))
lig.data <- lig.data[subs]

N <- sum(size)

# compute negative potential
neg.pot <- matrix(0, N,m)
for (j in 1:length(lam))
  neg.pot[,j] <- npot.fcn(x=lig.data, lam=lam[j])

# estimate free energies 
out <- uwham(logQ=neg.pot, size=size, fisher=TRUE)

-out$ze/bet + 0.71
sqrt(out$ve)/bet

# block bootstrap for free energies, 
# pretending that the data are generated from independent chains.
# To save time for package checking, this is not run.
#out.boot <- uwham.boot(proc.type="indep", 
#                       block.size=rep(50,m-2), boot.size=100, 
#                       logQ=neg.pot, size=size)
#
#-out.boot$ze/bet + 0.71
#sqrt(out.boot$ve)/bet

#######################################
## example 3 (serial tempering data) ##
#######################################

rm(list=ls())

# inverse temperature
bet <- 1.0/(0.001986209*300.0)

# negative potential function 
npot.fcn <- function(x, lam)
   -bet*lam*x

# lambda states
lam <- c(0.0,0.001,0.002,0.004,0.005,0.006,0.008,0.01,0.02,0.04,
         0.07,0.1,0.25,0.5,0.55,0.6,0.65,0.7,0.75,0.8,
         0.85,0.9,0.95,1.0)
m <- length(lam)

# loads cyclooctanol dataset
data(cyclooctanol)
lig.data <- cyclooctanol$V2

# sample size
N <- length(lig.data)

# state labels based on lambda values
# note that labels=1:m, not 0:(m-1)
state.labels <- factor(cyclooctanol$V1, labels=1:m)

# compute negative potential
neg.pot <- matrix(0, N,m)
for (j in 1:m)
  neg.pot[,j] <- npot.fcn(x=lig.data, lam=lam[j])

# estimate free energies, note that size=NULL because label is given
out <- uwham(label=state.labels, logQ=neg.pot, fisher=TRUE)

# free energies as a function of lambda, 0.36 kcal/mol is a standard
# state correction
-out$ze/bet + 0.36
sqrt(out$ve)/bet

# block bootstrap for free energies, note that proc.type="serial"
# for simulated tempering data.
# To save time for package checking, this is not run.
#out.boot <- uwham.boot(proc.type="serial", block.size=10, boot.size=100, 
#                       label=state.labels, logQ=neg.pot)
#
#-out.boot$ze/bet + 0.36
#sqrt(out.boot$ve)/bet



