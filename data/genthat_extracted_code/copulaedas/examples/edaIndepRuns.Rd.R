library(copulaedas)


### Name: edaIndepRuns
### Title: Independent Runs
### Aliases: edaIndepRuns

### ** Examples

setMethod("edaReport", "EDA", edaReportSimple)
setMethod("edaTerminate", "EDA",
    edaTerminateCombined(edaTerminateMaxGen,
        edaTerminateEval))

DVEDA <- VEDA(vine = "DVine", copulas = c("normal"),
    indepTestSigLevel = 0.01, margin = "norm", popSize = 200,
    maxGens = 50, fEval = 0, fEvalTol = 1e-03)
DVEDA@name <- "D-vine Estimation of Distribution Algorithm"

results <- edaIndepRuns(DVEDA, fSphere, rep(-600, 5), rep(600, 5), 5)

show(results)
summary(results)



