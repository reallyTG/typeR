library(multilevelPSA)


### Name: mlpsa.circ.plot
### Title: Plots the results of a multilevel propensity score model.
### Aliases: mlpsa.circ.plot

### ** Examples

## Not run: 
##D data(pisana)
##D data(pisa.colnames)
##D data(pisa.psa.cols)
##D mlctree = mlpsa.ctree(pisana[,c('CNT','PUBPRIV',pisa.psa.cols)], 
##D                       formula=PUBPRIV ~ ., level2='CNT')
##D student.party = getStrata(mlctree, pisana, level2='CNT')
##D student.party$mathscore = apply(student.party[,paste0('PV', 1:5, 'MATH')], 1, sum) / 5
##D results.psa.math = mlpsa(response=student.party$mathscore, 
##D        treatment=student.party$PUBPRIV, 
##D        strata=student.party$strata, 
##D        level2=student.party$CNT, minN=5)
##D mlpsa.circ.plot(results.psa.math, legendlab=FALSE)
## End(Not run)



