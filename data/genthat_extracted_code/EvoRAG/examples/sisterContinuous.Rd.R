library(EvoRAG)


### Name: sisterContinuous
### Title: likelihood functions for continuous trait evolutionary models
### Aliases: sisterContinuous
### Keywords: Brownian Motion Ornstein Uhlenbeck

### ** Examples


data(bird.pitch)
attach(bird.pitch)

###The following example uses optim to find the maximum likelihood estimate 
###on data from Weir et al 2012.

#STEP 1: Correct Euclidean distances for sampling and measurement bias
DIST_cor <- MScorrection(nA=bird.pitch$number_individuals_Species1,
   nB=bird.pitch$number_individuals_Species2, 
   VarA=bird.pitch$Variance_PC1and2_Species1, 
   VarB=bird.pitch$Variance_PC1and2_Species2, 
   DIST_actual=bird.pitch$Uncorrected_Euclidean_Distance)

#STEP 2: Extract and test only forest species
DIST <- subset(DIST_cor, subset = (bird.pitch$Habitat == "forest"))
TIME <- subset(bird.pitch$TIME, subset = (bird.pitch$Habitat == "forest"))
GRAD <- subset(bird.pitch$GRAD, 
   subset = (bird.pitch$Habitat == "forest"))

#STEP 4: fit the model using optim
res <- optim(par = c(0.1,0.001), fn=sisterContinuous, model = c("BM_linear"),
     DIST=DIST, TIME=TIME, GRAD=GRAD, method="L-BFGS-B",lower=c(0,-5),upper=c(Inf,5))


    



