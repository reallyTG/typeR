library(DynTxRegime)


### Name: Regime-class
### Title: Class '"Regime"'
### Aliases: Regime-class regimeCoef,Regime-method
### Keywords: internal

### ** Examples

showClass("Regime")

data <- data.frame(x1 = rnorm(10), x2 = rnorm(10), x3 = rnorm(10))

regime <- function(a,b,c,data){
            return(a*data$x1 + b*data$x2 + c*data$x3 < 0)
          }

regObj <- new("Regime",
              nVars = 3L,
              vNames = c("a","b","c"),
              func = regime,
              pars = c(0.1,0.2,0.3))

is(regObj)

DynTxRegime:::.getNumPars(object = regObj)
DynTxRegime:::.getParNames(object = regObj)
DynTxRegime:::.getPars(object = regObj)
DynTxRegime:::.getRegimeFunction(object = regObj)
DynTxRegime:::.predictOptimalTx(x = regObj, newdata = data)
regObj <- DynTxRegime:::.setPars(object = regObj, pars = c(0.2,0.1,0.3))
DynTxRegime:::.getPars(object = regObj)
regimeCoef(object = regObj)



