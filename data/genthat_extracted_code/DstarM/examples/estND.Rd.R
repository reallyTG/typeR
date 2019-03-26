library(DstarM)


### Name: estND
### Title: Estimate nondecision denstiy
### Aliases: estND

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
dat = simData(n = 3e5, pars = pars, tt = tt, pdfND = pdfND)
# define restriction matrix
restr = matrix(1:5, 5, 3)
restr[2, 2:3] = 6:7 # allow drift rates to differ
# fix variance parameters
fixed = matrix(c('sz1', .5, 'sv1', .5), 2, 2)
## Not run: 
##D # Run D*M analysis
##D res = estDstarM(data = dat, tt = tt, restr = restr, fixed = fixed)
##D # Estimate nondecision density
##D resND = estND(res)
##D plot(resND)
##D lines(tt, pdfND, type = 'b', col = 2)
## End(Not run)



