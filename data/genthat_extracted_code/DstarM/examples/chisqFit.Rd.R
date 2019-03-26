library(DstarM)


### Name: chisqFit
### Title: Calculate model fit
### Aliases: chisqFit

### ** Examples

tt = seq(0, 5, .1)
pars = c(.8, 2, .5, .5, .5, # condition 1
         .8, 3, .5, .5, .5,  # condition 2
         .8, 4, .5, .5, .5)  # condition 3
pdfND = dbeta(tt, 10, 30)

# simulate data
allDat = simData(n = 3e3, pars = pars, tt = tt, pdfND = pdfND, return.pdf = TRUE)
truePdf = allDat$pdfUnnormalized
dat = allDat$dat
chisqFit(resObserved = truePdf, data = dat, tt = tt)
## Not run: 
##D # estimate it
##D define restriction matrix
##D restr = matrix(1:5, 5, 3)
##D restr[2, 2:3] = 6:7 # allow drift rates to differ
##D # fix parameters for speed up
##D fixed = matrix(c('z1', 'a1 / 2', 'sz1', .5, 'sv1', .5), 2, 3)
##D resD = estDstarM(data = dat, tt = tt, restr = restr, fixed = fixed,
##D                  Optim = list(parallelType = 1))
##D resN = estND(resD, Optim = list(parallelType = 1))
##D 
##D resO = estObserved(resD, resN, data = dat)
##D resO$fit # proper fit
## End(Not run)



