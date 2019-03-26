library(openCR)


### Name: simulation
### Title: Simulate Capture Histories
### Aliases: sim.nonspatial runsim.nonspatial runsim.spatial runsim.RMark
###   sumsims
### Keywords: datagen

### ** Examples


ch <- sim.nonspatial(100, list(phi = 0.7, lambda = 1.1), p = 0.3, nsessions = 8, noccasions=2)

openCR.fit(ch, type = 'CJS')


## Not run: 
##D 
##D turnover <- list(phi = 0.85, lambda = 1.0, recrmodel = 'constantN')
##D 
##D ## using type = 'JSSAlCL' and extractfn = predict
##D 
##D fitarg <- list(type = 'JSSAlCL', model = list(p~t, phi~t, lambda~t))
##D out <- runsim.nonspatial(nrepl = 100, N = 100, ncores = 6, turnover = turnover, 
##D    p = 0.2, recapfactor = 4, nsessions = 10, noccasions = 1, fitargs = fitarg)
##D sumsims(out, 'lambda', 1:10)
##D 
##D ## using type = 'Pradelg' and extractfn = derived
##D ## homogeneous p
##D fitarg <- list(type = 'Pradelg', model = list(p~t, phi~t, gamma~t))
##D outg <- runsim.nonspatial(nrepl = 100, N = 100, ncores = 6, turnover = turnover, 
##D     p = 0.2, recapfactor = 4, nsessions = 10, noccasions = 1, 
##D     fitargs = fitarg, extractfn = derived)
##D apply(sapply(outg, function(x) x$estimates$lambda),1,mean)
##D 
##D turnover <- list(phi = 0.85, lambda = 1.0, recrmodel = 'discrete')
##D 
##D ## 2-class mixture for p
##D outg2 <- runsim.nonspatial(nrepl = 100, N = c(50,50), ncores = 6, turnover = turnover, 
##D     p = c(0.3,0.9), recapfactor = 1, nsessions = 10, noccasions = 1, 
##D     fitargs = fitarg, extractfn = derived)
##D outg3 <- runsim.nonspatial(nrepl = 100, N = c(50,50), ncores = 6, turnover = turnover, 
##D     p = c(0.3,0.3), recapfactor = 1, nsessions = 10, noccasions = 1, 
##D     fitargs = fitarg, extractfn = derived)
##D apply(sapply(outg2, function(x) x$estimates$lambda),1,mean)
##D 
##D plot(2:10, apply(sapply(outg2, function(x) x$estimates$lambda),1,mean)[-1],
##D     type='o', xlim = c(1,10), ylim = c(0.9,1.1))
##D 
##D ## RMark
##D 
##D extfn <- function(x) x$results$real$estimate[3:11]
##D MarkPath <- 'c:/mark'  # customise as needed
##D turnover <- list(phi = 0.85, lambda = 1.0, recrmodel = 'discrete')
##D outrm <- runsim.RMark (nrepl = 100, model = 'Pradlambda', extractfn = extfn, 
##D                        model.parameters = list(Lambda=list(formula=~time)),
##D                        N = c(200,200), turnover = turnover, p = c(0.3,0.9),
##D                        recapfactor = 1, nsessions = 10, noccasions = 1)
##D extout <- apply(do.call(rbind, outrm),1,mean)
##D 
##D ## Spatial
##D 
##D grid <- make.grid()
##D msk <- make.mask(grid, type = 'trapbuffer', nx = 32)
##D turnover <- list(phi = 0.8, lambda = 1)
##D poparg <- list(D = 10, core = grid, buffer = 100, Ndist = 'fixed', nsessions = 6, 
##D     details = turnover)
##D detarg <- list(noccasions = 5, detectfn = 'HHN', detectpar = list(lambda0 = 0.5, sigma = 20))
##D fitarg <- list(type = 'JSSAsecrfCL', mask = msk, model = list(phi~1, f~1))
##D sims <- runsim.spatial (nrepl = 7, ncores = 7, pop = poparg, det = detarg, fit = fitarg)
##D sumsims(sims)
##D 
##D ## extract the convergence code from nlm for each replicate in preceding simulation
##D sapply(lapply(sims, attr, 'fit'), '[[', 'code')
##D ## if method != 'Newton-Raphson then optim is used and the code is named 'convergence'
##D # sapply(lapply(sims, attr, 'fit'), '[[', 'convergence')
##D 
## End(Not run)




