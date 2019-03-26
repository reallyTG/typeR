library(DstarM)


### Name: plotObserved
### Title: Plot quantiles of data against model implied quantiles.
### Aliases: plotObserved

### ** Examples

# simulate data with three stimuli of different difficulty.
# this implies different drift rates across conditions.
# define a time grid. A more reasonable stepsize is .01; this is just for speed.
tt = seq(0, 5, .1)
pars = c(.8, 2, .5, .5, .5, # condition 1
        .8, 3, .5, .5, .5, # condition 2
        .8, 4, .5, .5, .5) # condition 3
pdfND = dbeta(tt, 10, 30)
# simulate data
lst = simData(n = 3e5, pars = pars, tt = tt, pdfND = pdfND, return.pdf = TRUE)
dat = lst$dat
# define restriction matrix
restr = matrix(1:5, 5, 3)
restr[2, 2:3] = 6:7 # allow drift rates to differ
# fix variance parameters
fixed = matrix(c('sz1', .5, 'sv1', .5), 2, 2)
## Not run: 
##D # Run D*M analysis
##D resD = estDstarM(dat = dat, tt = tt, restr = restr, fixed = fixed)
##D # Estimate nondecision density
##D resND = estND(resD)
##D # Estimate observed density
##D resObs = estObserved(resD, resND)
##D # plot histograms with overlayed
##D # densities per condition-response pair
##D plotObserved(resObserved = resObs, data = dat,
##D             xlim = c(0, 1))
##D # plot estimated and true densities
##D plot(resObs, col = rep(1:3, each = 2), xlim = 0:1)
##D matlines(tt, lst$pdfNormalized, col = rep(1:3, each = 2), lty = 2)
##D # other uses of plotObserved
##D plotObserved(resObserved = resObs, data = dat, what = 'cr', xlim = c(0, 1))
##D plotObserved(resObserved = resObs, data = dat, what = 'c', xlim = c(0, 1))
##D plotObserved(resObserved = resObs, data = dat, what = 'r', xlim = c(0, 1))
## End(Not run)



