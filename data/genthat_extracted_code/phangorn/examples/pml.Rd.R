library(phangorn)


### Name: pml.control
### Title: Likelihood of a tree.
### Aliases: pml.control pml optim.pml
### Keywords: cluster

### ** Examples


  example(NJ)
# Jukes-Cantor (starting tree from NJ)  
  fitJC <- pml(tree, Laurasiatherian)  
# optimize edge length parameter     
  fitJC <- optim.pml(fitJC)
  fitJC 
  
## Not run: 
##D     
##D # search for a better tree using NNI rearrangements     
##D   fitJC <- optim.pml(fitJC, optNni=TRUE)
##D   fitJC   
##D   plot(fitJC$tree)
##D 
##D # JC + Gamma + I - model
##D   fitJC_GI <- update(fitJC, k=4, inv=.2)
##D # optimize shape parameter + proportion of invariant sites     
##D   fitJC_GI <- optim.pml(fitJC_GI, optGamma=TRUE, optInv=TRUE)
##D # GTR + Gamma + I - model
##D   fitGTR <- optim.pml(fitJC_GI, rearrangement = "stochastic", 
##D       optGamma=TRUE, optInv=TRUE, model="GTR") 
## End(Not run)


# 2-state data (RY-coded)  
  dat <- acgt2ry(Laurasiatherian) 
  fit2ST <- pml(tree, dat) 
  fit2ST <- optim.pml(fit2ST,optNni=TRUE) 
  fit2ST
# show some of the methods available for class pml
  methods(class="pml")  




