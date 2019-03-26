library(fam2r)


### Name: FamiliasConditional
### Title: Conditional simulation of marker data on pedigrees and
###   'Familias' likelihood
### Aliases: FamiliasConditional FamiliasConditionalOne

### ** Examples

# Example. Mutation.
# See documentation of conditionalLR for examples without mutation
data(grandmother)
pedigrees = grandmother$pedigrees
datamatrix = grandmother$datamatrix
persons = rownames(datamatrix)
Nsim = 100 
p = c(0.5,0.5)
loci = list(FamiliasLocus(p, 1:2, "L1", MutationModel = "Proportional",
                          MutationRate=0.005))
res1 = FamiliasConditional(Nsim = Nsim, datamatrix,  loci, pedigrees, 
                           truePed = 1, available = "GS", ref=2, seed=17)
LR1 = table(res1$LR.All.Markers[,1])/Nsim 
# Next, we calculate genotype probabilities for GS exactly
x = Familias2linkdat(pedigrees[[1]], datamatrix, loci)
m = marker(x, 1:2)
x = addMarker(x,m)
p.GS = oneMarkerDistribution(x, 3, partialmarker=1, verbose = FALSE)
# The difference between simulated and exact probabilities are
LR1 - p.GS[c(2,3,1)]

### Example 
data(Demo3Markers)
pedigrees = Demo3Markers$pedigrees
datamatrix = Demo3Markers$datamatrix
loci = Demo3Markers$loci
x = Familias2linkdat(pedigrees, datamatrix, loci)  
P.mother.H1 = oneMarkerDistribution(x[[1]], ids=3, partialmarker=3,
  ignore.affection=TRUE)
P.mother.H2 = oneMarkerDistribution(x[[2]][[1]], ids=3,
  partialmarker=3, ignore.affection=TRUE)
all(round(P.mother.H1/P.mother.H2,10) == 1)
# The probability distribution of the mother is the same for both hypotheses
# and therefore we always get the same LR.

# Example 
data(symmetric)
pedigrees = symmetric$pedigrees
datamatrix = symmetric$datamatrix
loci = symmetric$loci
persons = rownames(datamatrix)
## Not run: 
##D # Plot with newdev=TRUE, resize plot window and then plot with newdev=FALSE
##D x = Familias2linkdat(pedigrees, datamatrix, loci)
##D plotPedList(x, newdev=FALSE, frametitles=c("H1", "H2", "H3"), 
##D   available="shaded", marker=1:2, skip.empty.genotypes = TRUE)
## End(Not run)
res1 = FamiliasConditional(Nsim = 2, datamatrix,  loci, pedigrees, 
                truePed = 1, available = "MO", ref = 2, seed = 17)
# Without mutation, all LRs 1. With mutation:
res1$LR.All.Markers



