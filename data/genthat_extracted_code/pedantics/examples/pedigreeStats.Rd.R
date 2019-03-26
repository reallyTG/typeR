library(pedantics)


### Name: pedigreeStats
### Title: Calculates a range of statistics of pedigrees.
### Aliases: pedigreeStats

### ** Examples


## Not run: 
##D 
##D data(gryphons)
##D pedigree<-gryphons[,1:3]
##D 
##D gryphonsPedigreeSummary<-pedigreeStats(pedigree,
##D                        cohorts=gryphons$cohort,graphicalReport='n')
##D 
##D gryphonsPedigreeSummary$totalMaternities
##D gryphonsPedigreeSummary$totalPaternities
##D 
##D gryphonsPedigreeSummary$maternitiesByCohort
##D gryphonsPedigreeSummary$paternitiesByCohort
##D 
## End(Not run)



