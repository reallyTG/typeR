library(copulaedas)


### Name: CEDA-class
### Title: Class for Copula EDAs
### Aliases: CEDA CEDA-class edaLearnCEDA edaSampleCEDA
###   edaLearn,CEDA-method edaSample,CEDA-method
### Keywords: classes

### ** Examples

setMethod("edaTerminate", "EDA", edaTerminateEval)
setMethod("edaReport", "EDA", edaReportSimple)

UMDA <- CEDA(copula = "indep", margin = "norm",
    popSize = 200, fEval = 0, fEvalTol = 1e-03)
UMDA@name <- "Univariate Marginal Distribution Algorithm"

GCEDA <- CEDA(copula = "normal", margin = "norm",
    popSize = 200, fEval = 0, fEvalTol = 1e-03)
GCEDA@name <- "Gaussian Copula Estimation of Distribution Algorithm"

resultsUMDA <- edaRun(UMDA, fSphere, rep(-600, 5), rep(600, 5))
resultsGCEDA <- edaRun(GCEDA, fSphere, rep(-600, 5), rep(600, 5))

show(resultsUMDA)
show(resultsGCEDA)



