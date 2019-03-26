library(stratification)


### Name: strata.LH
### Title: Generalized Lavallee-Hidiroglou Method of Strata Construction
### Aliases: strata.LH
### Keywords: survey

### ** Examples

#########################################################
### Sethi's algorithm versus Kozak's algorithm

# LACK OF CONVERGENCE
# Here is an example of numerical difficulties met with Sethi but not with Kozak  
Sethi <- strata.LH(x=UScities, CV=0.01, Ls=3, alloc=c(0.35,0.35,0), takenone=0, takeall=1,
         rh=1, model="loglinear", model.control=list(beta=1, sig2=0.5, ph=0.85), 
         algo="Sethi", algo.control=list(maxiter=20))
Sethi
Sethi$iter.detail[1:5,]
# Kozak's algorithm with arithmetic initial boundaries 
# (default initial boundaries for Sethi's algorithm) 
Kozak<-strata.LH(x=UScities, initbh=c(18,27), CV=0.01, Ls=3, alloc=c(0.35,0.35,0),
       takenone=0, takeall=1, rh=1, model="loglinear",
       model.control=list(beta=1, sig2=0.5, ph=0.85), algo="Kozak")
Kozak
Kozak$iter.detail[Kozak$iter.detail[,"run"]==Kozak$run.min[1],]
# Looking at the iteration history for the optimization with Sethi and Kozak, 
# we see that the initial boundaries are very close from the optimal ones. 
# Kozak reaches very quickly a minimum. However, Sethi increases n instead of 
# minimizing it and afterwards it oscillates between two sets of boundaries 
# without converging.

# LOCAL MINIMUM
# In this example, Sethi's algorithm obviously reaches a local minimum since Kozak 
# proposes a much smaller n.
Sethi<-strata.LH(x=UScities, CV=0.01, Ls=4, alloc=c(0.5,0,0), takenone=0, takeall=1, 
       rh=0.85, model="loglinear", model.control=list(beta=1.1, sig2=0, ph=1),
       algo="Sethi")
Sethi
Kozak<-strata.LH(x=UScities, CV=0.01, Ls=4, alloc=c(0.5,0,0), takenone=0, takeall=1,
       rh=0.85, model="loglinear", model.control=list(beta=1.1, sig2=0, ph=1),
       algo="Kozak")
Kozak


#########################################################
### Take-none stratum

# As illustrated in the following example (presented in Baillargeon and Rivest 2011), 
# it is sometimes beneficial to include a take-none stratum in the stratified design 
# (possibly with a bias penalty lower than 1).
notn <- strata.LH(x=MRTS, CV=0.1, Ls=3, alloc=c(0.5,0,0.5))
notn
tn1 <- strata.LH(x=MRTS, CV=0.1, Ls=3, alloc=c(0.5,0,0.5), takenone=1)
tn1
tn0.5 <- strata.LH(x=MRTS, CV=0.1, Ls=3, alloc=c(0.5,0,0.5), takenone=1, bias.penalty=0.5)
tn0.5

# Note: Sethi does not converge here. This occurs often with a take-none stratum.
tn1.Sethi <- strata.LH(x=MRTS, CV=0.1, Ls=3, alloc=c(0.5,0,0.5), takenone=1, algo="Sethi")
tn1.Sethi


#########################################################
### Automatic detection of a take-all stratum

# # As in the following example, a beneficial take-all stratum is not always detected 
# # by the algorithm. Therefore, it is often a good idea to obtain a stratified design
# # with and without a take-all stratum and to compare the results.
# sans<-strata.LH(x=UScities, n=300, Ls=3, alloc=c(0.35,0.35,0), takeall=0,
#       model="loglinear", model.control=list(beta=0.9, sig2=0, ph=1),
#       algo.control=list(trymany=FALSE))
# sans
# avec<-strata.LH(x=UScities, n=300, Ls=3, alloc=c(0.35,0.35,0), takeall=1,
#       model="loglinear", model.control=list(beta=0.9,sig2=0,ph=1),
#       algo.control=list(trymany=FALSE))
# avec
# # We see that for the target sample size, the anticipated CV is 17% lower with a 
# # take-all stratum (0.01081053 vs 0.009002313).


#########################################################
### Models for the discrepancy between Y and X

# LOGLINEAR MODEL WITH MORTALITY: see help(Sweden)

# HETEROSCEDASTIC LINEAR MODEL:  We fix gamma=2.
beta.lin <- mean(Sweden$RMT85/Sweden$REV84)
sig2.lin <- var(Sweden$RMT85/Sweden$REV84)
strata.LH(x=Sweden$REV84, CV=0.05, Ls=5, alloc=c(0.5,0,0.5), takeall=1,
          model="linear", model.control=list(beta=beta.lin, sig2=sig2.lin, gamma=2),
          algo="Kozak")
# Verification of equation 3.6 of Rivest (2002)
beta.log <- 1
sig2.log <- log(1+sig2.lin/beta.lin^2)
strata.LH(x=Sweden$REV84, CV=0.05, Ls=5, alloc=c(0.5,0,0.5), takeall=1,
          model="loglinear", model.control=list(beta=beta.log, sig2=sig2.log, ph=1),
          algo="Kozak")
# The two models give the same stratified design.

# RANDOM REPLACEMENT MODEL: example in Rivest (1999)
strata.LH(x=Sweden$REV84, CV=0.05, Ls=5, alloc=c(0.5,0,0.5), takeall=1,
       model="none", algo="Sethi")     # Table 1 with a different rounding of the nh's
e0 <- strata.LH(x=Sweden$REV84, CV=0.05, Ls=5, alloc=c(0.5,0,0.5), takeall=1,
       model="none", algo="Kozak")
e0                                    # Better than Sethi
var.strata(e0, y=Sweden$RMT85)
e0.001 <- strata.LH(x=Sweden$REV84, CV=0.05, Ls=5, alloc=c(0.5,0,0.5), takeall=1,
          model="random", model.control=list(epsilon=0.011), algo="Kozak")
e0.001                          # Table 2 part 3 with a different rounding of the nh's
var.strata(e0.001 ,y=Sweden$RMT85)




