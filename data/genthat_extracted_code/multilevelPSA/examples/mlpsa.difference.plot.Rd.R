library(multilevelPSA)


### Name: mlpsa.difference.plot
### Title: Creates a graphic summarizing the differences between treatment
###   and comparison groups within and across level two clusters.
### Aliases: mlpsa.difference.plot

### ** Examples

## Not run: 
##D data(pisana)
##D data(pisa.colnames)
##D data(pisa.psa.cols)
##D mlctree = mlpsa.ctree(pisana[,c('CNT','PUBPRIV',pisa.psa.cols)], formula=PUBPRIV ~ ., level2='CNT')
##D student.party = getStrata(mlctree, pisana, level2='CNT')
##D student.party$mathscore = apply(student.party[,paste0('PV', 1:5, 'MATH')], 1, sum) / 5
##D results.psa.math = mlpsa(response=student.party$mathscore, 
##D        treatment=student.party$PUBPRIV, 
##D        strata=student.party$strata, 
##D        level2=student.party$CNT, minN=5)
##D mlpsa.difference.plot(results.psa.math, sd=mean(student.party$mathscore, na.rm=TRUE))
## End(Not run)



