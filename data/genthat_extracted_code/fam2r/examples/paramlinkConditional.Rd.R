library(fam2r)


### Name: paramlinkConditional
### Title: Conditional simulation of marker data on pedigrees and
###   'paramlink' likelihood
### Aliases: paramlinkConditional paramlinkConditionalOne

### ** Examples


# Example 
data(grandmother)
pedigrees = grandmother$pedigrees
datamatrix = grandmother$datamatrix
loci = grandmother$loci
persons = rownames(datamatrix)
Nsim = 5 #Increase to 1000
res1 = paramlinkConditional(Nsim = Nsim, datamatrix, loci, pedigrees, 
                           truePed = 1, available = "GS", ref=2, seed=17)
LR.H1 = table(res1$LR.All.Markers[,1])/Nsim 
# LR(H1) distribution, agrees well with theory:
# Pr(LR=0.5|H1) = 0.49005, Pr(LR=25.5|H1) = 0.50490, Pr(LR=50.5|H1) = 0.00505
# Simulate from unrelated alternative: 
res2 = paramlinkConditional(Nsim = Nsim, datamatrix,  loci, pedigrees, 
                           truePed = 2, available = "GS", ref=2, seed=17)
LR.H2 = table(res2$LR.All.Markers[,1])/Nsim
# Try mutation 
p = as.double(loci[[1]]$alleles)
loci = list(FamiliasLocus(p, 1:3, "L1", MutationModel = "Proportional",
                          MutationRate=0.005))
x = Familias2linkdat(pedigrees, datamatrix, loci)
res1 = paramlinkConditional(Nsim = Nsim, datamatrix,  loci, pedigrees, 
                           truePed = 1, available = "GS", ref=2, seed=17)
# Simulate father instead
res1 = paramlinkConditional(Nsim = Nsim, datamatrix,  loci, pedigrees, 
                           truePed = 1, available = "FAT", ref=2, seed=17)
LR.H1 = table(res1$LR.All.Markers[,1])/Nsim 

res2 = paramlinkConditional(Nsim = Nsim, datamatrix,  loci, pedigrees, 
                           truePed = 2, available = "FAT", ref=2, seed=17)
LR.H2 = table(res2$LR.All.Markers[,1])/Nsim

### Example 
data(Demo3Markers)
pedigrees = Demo3Markers$pedigrees
datamatrix = Demo3Markers$datamatrix
loci = Demo3Markers$loci
persons = rownames(datamatrix)
Nsim = 5
res1 = paramlinkConditional(Nsim = Nsim, datamatrix,  loci, pedigrees, 
                           truePed = 1, available = "Mother", ref=2, seed=177)
res1[[1]][,1] #Always the same LR! Why?:
x = Familias2linkdat(pedigrees, datamatrix,loci)
P.mother.H1 = oneMarkerDistribution(x[[1]],3,3, verbose=FALSE)
P.mother.H2 = oneMarkerDistribution(x[[2]][[1]],3,3, verbose=FALSE) 
round(P.mother.H1/P.mother.H2,10) == 1
# The probability distribution of the mother is the same for both hypotheses
# and therefore we always get the same LR.

# Example 
data(symmetric)
pedigrees = symmetric$pedigrees
datamatrix = symmetric$datamatrix
loci = symmetric$loci
persons = rownames(datamatrix)
res1 = paramlinkConditional(Nsim = 2, datamatrix, loci, pedigrees, 
                           truePed = 1, available = NULL, ref=2, seed=17)
# Without mutation, all LRs 1. With mutation:
res1$LR.All.Markers

# Example  Mariana's F21 example
## Not run: 
##D  #Takes a few minutes; compares 'Familias' and 'paramlink'.
##D   #Results and paramlink execution times
##D   data(F21)
##D   pedigrees = F21$pedigrees
##D   datamatrix = F21$datamatrix
##D   loci = F21$loci
##D   persons = rownames(datamatrix)
##D   Nsim = 1000
##D   start.time <- Sys.time()
##D   res1.paramlink = paramlinkConditional(Nsim = Nsim, datamatrix, loci, pedigrees, 
##D                              truePed = 1, available = "Missing Person", ref=2, seed=17)
##D   res2.paramlink = paramlinkConditional(Nsim = Nsim, datamatrix,  loci, pedigrees, 
##D                              truePed = 2, available = "Missing Person", ref=2, seed=17)
##D   end.time <- Sys.time()
##D   paramlink.time <- end.time - start.time
##D   start.time <- Sys.time()
##D   res1.familias = FamiliasConditional(Nsim = Nsim, datamatrix,  loci, pedigrees, 
##D                               truePed = 1, available = "Missing Person", ref=2, seed=17)
##D   res2.familias = FamiliasConditional(Nsim = Nsim, datamatrix,  loci, pedigrees, 
##D                               truePed = 2, available = "Missing Person", ref=2, seed=17)
##D   end.time <- Sys.time()
##D   familias.time <- end.time - start.time
##D   familias.time - paramlink.time #around -0.7 mins
##D   LR1.familias = res1.familias[[1]][,1]
##D   LR1.paramlink = res1.paramlink[[1]][,1]
##D   aa=cbind(LR1.familias, LR1.paramlink)
##D   foo=apply(aa,2, quantile)
##D   foo = LR1.familias - LR1.paramlink
##D   max(foo/(0.5*(LR1.familias+LR1.paramlink)))
##D   LR1.familias = res2.familias[[1]][,1]
##D   LR1.paramlink = res2.paramlink[[1]][,1]
##D   aa=cbind(LR1.familias, LR1.paramlink)
##D   foo=apply(aa,2, quantile)
##D   foo = LR1.familias - LR1.paramlink
##D   max(foo)
##D  
## End(Not run)



