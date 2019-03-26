library(DynTxRegime)


### Name: Regime_DecisionPointList-class
### Title: Class '"Regime_DecisionPointList"'
### Aliases: Regime_DecisionPointList-class
###   regimeCoef,Regime_DecisionPointList-method
### Keywords: internal

### ** Examples

showClass("Regime_DecisionPointList")

data <- data.frame(x1 = rnorm(10), x2 = rnorm(10))

regime <- list()
regime[[1L]] <- function(a,data){
                  return(data$x1 < a)
                }

regime[[2L]] <- function(a,data){
                  return(data$x2 < a)
                }

regObj <- list()
regObj[[1L]] <- new("Regime",
                    nVars = 1L,
                    vNames = c("a"),
                    func = regime[[1L]],
                    pars = c(0.1))
regObj[[2L]] <- new("Regime",
                    nVars = 1L,
                    vNames = c("a"),
                    func = regime[[2L]],
                    pars = c(0.1))

regObj <- new("DecisionPointList", loo = regObj)
regObj <- new("Regime_DecisionPointList", regObj)

is(regObj)

DynTxRegime:::.getNumPars(object = regObj)
DynTxRegime:::.getParNames(object = regObj)
DynTxRegime:::.getPars(object = regObj)
DynTxRegime:::.getRegimeFunction(object = regObj)
DynTxRegime:::.predictOptimalTx(x = regObj, newdata = data, dp=1)
DynTxRegime:::.predictOptimalTx(x = regObj, newdata = data, dp=2)
regObj <- DynTxRegime:::.setPars(object = regObj, pars = c(0.2,0.2))
DynTxRegime:::.getPars(object = regObj)
regimeCoef(object = regObj)



