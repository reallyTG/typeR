library(paramlink)


### Name: LR
### Title: Likelihood ratios of pedigree hypotheses
### Aliases: LR

### ** Examples


# Simulate genotypes for 5 tetraallelic markers for a pair of full sibs
set.seed(123)
sibs = simpleSim(nuclearPed(2), N=5, alleles=1:4, available=3:4)

# Create two alternative hypotheses and transfer the simulated genotypes to them
halfsibs = addOffspring(nuclearPed(1),father=1,noffs=1,id=4)
halfsibs = transferMarkerdata(sibs, halfsibs)

unrel = list(singleton(3), singleton(4))
unrel = transferMarkerdata(sibs, unrel)

# Compute LR with 'unrelated' as reference
LR(list(sibs, halfsibs, unrel), ref=3)

## Not run: 
##D data(adoption)
##D x = Familias2linkdat(adoption$pedigrees, adoption$datamatrix, adoption$loci)
##D result = LRparamlink(x, ref=2)
##D result33 = LRparamlink(x, ref=2, marker=c(11,33))
## End(Not run)




