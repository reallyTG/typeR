library(spsann)


### Name: minmaxPareto
### Title: Pareto minimum and maximum values
### Aliases: minmaxPareto

### ** Examples

## Not run: 
##D # This example takes more than 5 seconds
##D require(sp)
##D data(meuse.grid)
##D candi <- meuse.grid[, 1:2]
##D covars <- meuse.grid[, c(1, 2)]
##D 
##D # CORR
##D schedule <- scheduleSPSANN(initial.acceptance = 0.1, chains = 1, 
##D                            x.max = 1540, y.max = 2060, x.min = 0,
##D                            y.min = 0, cellsize = 40)
##D set.seed(2001)
##D osc_corr <- optimCORR(points = 10, candi = candi, covars = covars, 
##D                       schedule = schedule)
##D 
##D # DIST
##D set.seed(2001)
##D osc_dist <- optimDIST(points = 10, candi = candi, covars = covars,
##D                       schedule = schedule)
##D 
##D # PPL
##D set.seed(2001)
##D osc_ppl <- optimPPL(points = 10, candi = candi, schedule = schedule)
##D 
##D # MSSD
##D set.seed(2001)
##D osc_mssd <- optimMSSD(points = 10, candi = candi, schedule = schedule)
##D 
##D # Pareto
##D pareto <- minmaxPareto(osc = list(DIST = osc_dist, CORR = osc_corr,
##D                                   PPL = osc_ppl, MSSD = osc_mssd),
##D                        candi = candi, covars = covars)
##D pareto
## End(Not run)



