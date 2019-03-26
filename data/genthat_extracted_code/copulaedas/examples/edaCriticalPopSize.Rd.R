library(copulaedas)


### Name: edaCriticalPopSize
### Title: Critical Population Size
### Aliases: edaCriticalPopSize

### ** Examples

setMethod("edaReport", "EDA", edaReportDisabled)
setMethod("edaTerminate", "EDA",
    edaTerminateCombined(edaTerminateEval,
        edaTerminateMaxEvals))

UMDA <- CEDA(copula = "indep", margin = "norm",
    fEval = 0, fEvalTol = 1e-03, maxEvals = 10000)
UMDA@name <- "Univariate Marginal Distribution Algorithm"

results <- edaCriticalPopSize(UMDA, fSphere, rep(-600, 10),
    rep(600, 10), 0, 1e-03, totalRuns = 30, successRuns = 30,
    lowerPop = 50, upperPop = 100, verbose = TRUE)

show(results)
summary(results)



