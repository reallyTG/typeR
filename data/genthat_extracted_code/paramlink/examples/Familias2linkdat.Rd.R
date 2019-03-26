library(paramlink)


### Name: Familias2linkdat
### Title: Convert 'Familias' output to linkdat objects
### Aliases: Familias2linkdat readFamiliasLoci connectedComponents

### ** Examples


# Example
## Not run: 
##D library(Familias)
##D data(NorwegianFrequencies)
##D locus1 = FamiliasLocus(NorwegianFrequencies$TH01)
##D persons = c('mother', 'daughter', 'AF')
##D ped1 = FamiliasPedigree(id=persons, dadid=c(NA, 'AF', NA), momid=c(NA, 'mother', NA), 
##D                          sex=c('female', 'female', 'male'))
##D datamatrix = data.frame(THO1.1=c(NA, 8, NA), THO1.2=c(NA,9.3, NA))
##D rownames(datamatrix) = persons
##D x = Familias2linkdat(ped1, datamatrix, locus1)
##D plotPedList(list(x), new=TRUE, frametitles=c('H1'), available='shaded', marker = 1)
##D 
##D # Example
##D library(fam2r)
##D data(F21)
##D pedigrees = F21$pedigrees
##D datamatrix = F21$datamatrix
##D loci = F21$loci
##D x = Familias2linkdat(pedigrees, datamatrix, loci)
##D plotPedList(x, new=TRUE, frametitles=c('H1', 'H2'), available='shaded')
##D 
##D # Give dev.width explicitly to allow for long names
##D plotPedList(x, new=TRUE, frametitles=c('H1', 'H2'), available='shaded',
##D             dev.width=17)
##D 
##D # Numerical labels work better
##D plotPedList(x, new=TRUE, id.labels='num', frametitles=c('H1', 'H2'),
##D             available='shaded')
## End(Not run)




