library(dynlm)


### Name: M1Germany
### Title: German M1 Money Demand
### Aliases: M1Germany
### Keywords: datasets

### ** Examples

data("M1Germany")
## fit the model of Luetkepohl et al. (1999) on the history period
## before the monetary unification 
histfm <- dynlm(d(logm1) ~ d(L(loggnp, 2)) + d(interest) + d(L(interest)) + d(logprice) +
                           L(logm1) + L(loggnp) + L(interest) +
                           season(logm1, ref = 4),
                data = M1Germany, start = c(1961, 1), end = c(1990, 2))

## fit on extended sample period
fm <- update(histfm, end = c(1995, 4))

if(require("strucchange")) {
  scus <- gefp(fm, fit = NULL)
  plot(scus, functional = supLM(0.1))
}



