library(FRESA.CAD)


### Name: EmpiricalSurvDiff
### Title: Estimate the LR value and its associated p-values
### Aliases: EmpiricalSurvDiff
### Keywords: Hypothesis_Testing

### ** Examples

	## Not run: 
##D 
##D       library(rpart)
##D       data(stagec)
##D 
##D       # The Log-Rank Analysis using survdiff
##D 
##D       lrsurvdiff <- survdiff(Surv(pgtime,pgstat)~grade>2,data=stagec)
##D       print(lrsurvdiff)
##D 
##D       # The Log-Rank Analysis: permutations of the null Chi distribution
##D       lrp <- EmpiricalSurvDiff(stagec$pgtime,stagec$pgstat,stagec$grade>2,
##D                          type="Chi",plots=TRUE,samples=10000,
##D                          main="Chi Null Distribution")
##D       print(list(unlist(c(lrp$LR,lrp$pvalue))))
##D 
##D       # The Log-Rank Analysis: permutations of the null SLR distribution
##D       lrp <- EmpiricalSurvDiff(stagec$pgtime,stagec$pgstat,stagec$grade>2,
##D                          type="SLR",plots=TRUE,samples=10000,
##D                          main="SLR Null Distribution")
##D       print(list(unlist(c(lrp$LR,lrp$pvalue))))
##D 
##D       # The Log-Rank Analysis: Bootstraping the SLR distribution
##D       lrp <- EmpiricalSurvDiff(stagec$pgtime,stagec$pgstat,stagec$grade>2,
##D                          computeDist=TRUE,plots=TRUE,samples=100000,
##D                          main="SLR Null and SLR bootrapped")
##D       print(list(unlist(c(lrp$LR,lrp$pvalue))))
##D 	
##D 	
## End(Not run)



