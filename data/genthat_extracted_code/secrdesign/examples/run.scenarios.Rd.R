library(secrdesign)


### Name: run.scenarios
### Title: Simulate Sampling Designs
### Aliases: run.scenarios fit.models
### Keywords: Datagen

### ** Examples


## Simple example: generate and summarise trapping data
## at two densities and for two levels of sampling frequency
scen1 <- make.scenarios(D = c(5,10), sigma = 25, g0 = 0.2, noccasions =
    c(5,10))
traps1 <- make.grid()   ## default 6 x 6 trap grid
tmp1 <- run.scenarios(nrepl = 20, trapset = traps1, scenarios = scen1,
    fit = FALSE)
summary(tmp1)

## Not run: 
##D 
##D ###########################
##D ## 2-phase example
##D ## first make and save rawdata
##D scen1 <- make.scenarios(D = c(5,10), sigma = 25, g0 = 0.2)
##D traps1 <- make.grid()   ## default 6 x 6 trap grid
##D tmp1 <- run.scenarios(nrepl = 20, trapset = traps1, scenarios = scen1,
##D     fit = FALSE, extractfn = identity)
##D 
##D ## review rawdata
##D summary(tmp1)
##D 
##D ## then fit and summarise models
##D tmp2 <- fit.models(tmp1, fit.args = list(list(model = g0~1),
##D     list(model = g0~T)), fit = TRUE, ncores = 4)
##D summary(tmp2)
##D ###########################
##D 
##D ## Construct a list of detector arrays
##D ## Each is a set of 5 parallel lines with variable between-line spacing;
##D ## the argument that we want to vary (spacey) follows nx, ny and spacex
##D ## in the argument list of make.grid().
##D 
##D spacey <- seq(2000,5000,500)
##D names(spacey) <- paste('line', spacey, sep = '.')
##D trapset <- lapply(spacey, make.grid, nx = 101, ny = 5, spacex = 1000,
##D     detector = 'proximity')
##D 
##D ## Make corresponding set of masks with constant spacing (1 km)
##D maskset <- lapply(trapset, make.mask, buffer = 8000, spacing = 1000,
##D     type = 'trapbuffer')
##D 
##D ## Generate scenarios
##D scen <- make.scenarios (trapsindex = 1:length(spacey), nrepeats = 8,
##D     noccasions = 2, D = 0.0002, g0 = c(0.05, 0.1), sigma = 1600, cross = TRUE)
##D 
##D ## RSE without fitting model
##D sim <- run.scenarios (50, scenarios = scen, trapset = trapset, maskset = maskset,
##D     ncores = 8, fit = TRUE, fit.args = list(method = 'none'), seed = 123)
##D 
##D ## Extract statistics for predicted density
##D sim <- select.stats(sim, parameter = 'D')
##D 
##D ## Plot to compare line spacing
##D summ <- summary (sim, type='array',  fields = c('mean','lcl','ucl'))$summary
##D plot(0,0,type='n', xlim=c(1.500,5.500), ylim = c(0,0.36), yaxs = 'i',
##D     xaxs = 'i', xlab = 'Line spacing  km', ylab = 'RSE (D)')
##D xv <- seq(2,5,0.5)
##D points(xv, summ$mean[,1,'RSE'], type='b', pch=1)
##D points(xv, summ$mean[,2,'RSE'], type='b', pch=16)
##D segments(xv, summ$lcl[,1,'RSE'], xv, summ$ucl[,1,'RSE'])
##D segments(xv, summ$lcl[,2,'RSE'], xv, summ$ucl[,2,'RSE'])
##D legend(4,0.345, pch=c(1,16), title = 'Baseline detection',
##D     legend = c('g0 = 0.05', 'g0 = 0.1'))
## End(Not run)




