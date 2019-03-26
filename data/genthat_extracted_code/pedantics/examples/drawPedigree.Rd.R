library(pedantics)


### Name: drawPedigree
### Title: Produce a graphical representation of a pedigree
### Aliases: drawPedigree
### Keywords: hplot

### ** Examples

data(gryphons)
pedigree<-fixPedigree(gryphons[,1:3])

## draw the gryphon pedigree by pedigree depth
drawPedigree(pedigree)

## draw the gryphon pedigree by cohort
# drawPedigree(pedigree,cohorts=gryphons$cohort,writeCohortLabels='y',
#                                                   cohortLabs.cex=1)

## Not run: 
##D 
##D ## draw the gryphon pedigree by cohort with only maternal links
##D drawPedigree(pedigree,cohorts=gryphons$cohort,links='mums')
##D 
##D ## draw the gryphon pedigree by cohort with colour only for those
##D ## indiduals that are informative relative to the quantitative
##D ## genetics of a hypothetical trait only measured for individuals
##D ## in the last two cohorts, emphasize the phenotyped individuals
##D ## with large black dots, and all other individuals with dots 
##D ## colour coded by sex:
##D dataAvailability<-(gryphons$cohort>=(max(gryphons$cohort)-1))+0
##D 
##D # not run
##D # drawPedigree(pedigree,cohorts=gryphons$cohort,sex=gryphons$sex,
##D #   dots='y',dat=dataAvailability,writeCohortLabels='y',dataDots='y')
##D 
## End(Not run)




