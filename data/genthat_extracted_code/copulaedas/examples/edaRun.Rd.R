library(copulaedas)


### Name: edaRun
### Title: Main Loop of an EDA
### Aliases: edaRun edaLearn edaSample

### ** Examples

setMethod("edaReport", "EDA", edaReportSimple)
setMethod("edaTerminate", "EDA",
    edaTerminateCombined(edaTerminateMaxGen,
        edaTerminateEval))

DVEDA <- VEDA(vine = "DVine", copulas = c("normal"),
    indepTestSigLevel = 0.01, margin = "norm",
    popSize = 200, maxGens = 50, fEval = 0,
    fEvalTol = 1e-03)
DVEDA@name <- "D-vine Estimation of Distribution Algorithm"

result <- edaRun(DVEDA, fSphere, rep(-600, 5), rep(600, 5))

show(result)



