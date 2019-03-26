library(fam2r)


### Name: grandmother
### Title: Dataset for missing grandchildren paper
### Aliases: grandmother Demo3Markers symmetric F21 E004 dc adoption

### ** Examples

data(grandmother) #One marker
data(Demo3Markers) #Three markers, one with mutation
#Three pedigrees, Half-sibs, avuncular and grandparent:
data(symmetric) 
data(E004) # E zero zero four
pedigrees = E004$pedigrees
datamatrix = E004$datamatrix
loci = E004$loci
avail = 7
persons = rownames(datamatrix)
x = Familias2linkdat(pedigrees, datamatrix, loci) 
missing.person.plot(x[[2]][[1]], missing=avail, marker=1:2, newdev=TRUE,
                    frametitle=c("H1", "H2"), dev.height=3.3, dev.width=9)
x=Familias2linkdat(pedigrees, datamatrix, loci)
missing.person.plot(x[[2]][[1]], missing=avail, marker=1:2, newdev=TRUE,
                    frametitle=c("H1", "H2"))
## Not run: 
##D  #Takes a few minutes
##D Nsim=1000
##D res.new = conditionalLR(Nsim=Nsim, datamatrix, loci, pedigrees, available=avail,
##D                      seed=1483118516, program = "Familias", ref=1 )
##D LRnew.mean =cbind(res.new[,,1][,2],res.new[,,2][,2])
##D apply(LRnew.mean,2,quantile)
## End(Not run)




