library(multilevelPSA)


### Name: tree.plot
### Title: Heat map representing variables used in a conditional inference
###   tree across level 2 variables.
### Aliases: tree.plot

### ** Examples

## Not run: 
##D require(party)
##D data(pisana)
##D data(pisa.colnames)
##D data(pisa.psa.cols)
##D mlctree = mlpsa.ctree(pisana[,c('CNT','PUBPRIV',pisa.psa.cols)], formula=PUBPRIV ~ ., level2='CNT')
##D student.party = getStrata(mlctree, pisana, level2='CNT')
##D tree.plot(mlctree, level2Col=pisana$CNT)
## End(Not run)



