library(bioPN)


### Name: c) Model Definition
### Title: Helper functions for model definition
### Aliases: init atr load.cfn unload.cfns

### ** Examples

## bioPN has been tested only on 64 bits machines.
## It may fail in 32 bits architecture.
if (.Machine$sizeof.pointer == 8) {

####### Constants definition (convenient but not required)
H <- 10
K <- 6
r <- 0.25
c <- 3
b <- 2
#######

place <- c( "Gi", "Ga", "mRNA", "Protein")

## WARNING: function init() accesses the frame
##          of the calling function, creating variables
##          with the names "model", "L", "R", and "h",
##          that are considered reserved to bioPN.
##          It also creates a variable for each element
##          in the place vector submitted to the function
##          init(). Function atr() creates a variable
##          for each transition name sent.

####### Initialization
init(place)

####### Start of model definition

## Gi -> Ga
h <- c
L[Gi] <- 1
R[Ga] <- 1
atr("gene_activation") ## Add this reaction

## Ga -> Gi
h <- b
L[Ga] <- 1
R[Gi] <- 1
atr("gene_inactivation")

## Ga -> Ga + mRNA
h <- H
L[Ga] <- 1
R[Ga] <- 1; R[mRNA] <- 1
atr("transcription")
  
## mRNA -> mRNA + Protein
h <- K
L[mRNA] <- 1
R[mRNA] <- 1; R[Protein] <- 1
atr("mRNA_degradation")

## mRNA -> 0
h <- 1
L[mRNA] <- 1
atr("translation")

## Protein -> 0
h <- r
L[Protein] <- 1
atr("protein_degradation")

####### End of model definition

model$M=rep(0, model$places)
model$M[Gi] <- 1

timep <- 200
delta <- 1

## Completely Deterministic
Sim <- RungeKuttaDormandPrince45(model, timep, delta)

runs <- 100

## Completely Stochastic
set.seed(19761111)  ## Set a seed (for reproducible results)
Sim <- GillespieOptimDirect(model, timep, delta, runs)

## Hybrid run
model$slow <- rep(0, model$transitions)
model$slow[c(gene_activation, gene_inactivation)] <- 1

set.seed(19761111)  ## Set a seed (for reproducible results)
Sim <- HaseltineRawlings(model, timep, delta, runs)
}



