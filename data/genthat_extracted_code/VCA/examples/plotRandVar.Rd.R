library(VCA)


### Name: plotRandVar
### Title: Plot Random Variates of a Mixed Model ('VCA' Object).
### Aliases: plotRandVar

### ** Examples


 ## Not run: 
##D data(dataEP05A2_1)
##D fit <- anovaVCA(y~day/run, dataEP05A2_1)
##D # solve mixed model equations including random effects
##D fit <- solveMME(fit)
##D plotRandVar(fit, "cond", "stand")	
##D plotRandVar(fit, 1, "stud")						# 1st random term 'day'
##D plotRandVar(fit, "day", "stud")					# equivalent to the above
##D 
##D # for larger datasets residuals can hardly be identified
##D # pick out interesting points with the mouse
##D 
##D plotRandVar(fit, "marg", "stud", pick=TRUE)
##D 
##D # customize the appearance
##D plotRandVar( fit, 1, "stud", Vlines=list(col=c("red", "darkgreen")), 
##D 	Xlabels=list(offset=.5, srt=60, cex=1, col="blue"),
##D 	Points=list(col=c("black", "red", rep("black", 18)),
##D pch=c(3,17,rep(3,18)), cex=c(1,2,rep(1,18))))	
## End(Not run) 



