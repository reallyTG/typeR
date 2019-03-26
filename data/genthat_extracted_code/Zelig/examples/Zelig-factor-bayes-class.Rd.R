library(Zelig)


### Name: Zelig-factor-bayes-class
### Title: Bayesian Factor Analysis
### Aliases: Zelig-factor-bayes-class zfactorbayes

### ** Examples

## Not run: 
##D data(swiss)
##D names(swiss) <- c("Fert", "Agr", "Exam", "Educ", "Cath", "InfMort")
##D z.out <- zelig(~ Agr + Exam + Educ + Cath + InfMort,
##D model = "factor.bayes", data = swiss,
##D factors = 2, verbose = FALSE,
##D a0 = 1, b0 = 0.15, burnin = 500, mcmc = 5000)
##D 
##D z.out$geweke.diag()
##D z.out <- zelig(~ Agr + Exam + Educ + Cath + InfMort,
##D model = "factor.bayes", data = swiss, factors = 2,
##D lambda.constraints =
##D    list(Exam = list(1,"+"),
##D         Exam = list(2,"-"),
##D         Educ = c(2, 0),
##D         InfMort = c(1, 0)),
##D verbose = FALSE, a0 = 1, b0 = 0.15,
##D burnin = 500, mcmc = 5000)
##D 
##D z.out$geweke.diag()
##D z.out$heidel.diag()
##D z.out$raftery.diag()
##D summary(z.out)
## End(Not run)




