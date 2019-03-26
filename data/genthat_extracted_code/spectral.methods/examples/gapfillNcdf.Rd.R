library(spectral.methods)


### Name: gapfillNcdf
### Title: Fill gaps in time series or spatial fields inside a netCDF file
###   using SSA.
### Aliases: gapfillNcdf

### ** Examples

    ## prerequisites: go to dir with ncdf file and specify file.name
    file.name        = 'scen_3_0.5_small.nc'
    max.cores        = 8
    calc.parallel    = TRUE
    
    ##example settings for traditional one dimensional "onlytime" setting and
    ## one step
    amnt.artgaps     <- list(list(c(0.05, 0.05)));
    amnt.iters       <- list(list(c(3, 10)));
    dimensions       <- list(list("time")); 
    M                <- list(list(12)); 
    n.comp           <- list(list(6)); 
    size.biggap      <- list(list(5)); 
    var.name         <- "auto"
    process.type     <- "stepwise"
#    .gapfillNcdf(file.name = file.name, dimensions = dimensions, amnt.iters = amnt.iters, 
#                amnt.iters.start = amnt.iters.start, amnt.artgaps = amnt.artgaps, 
#                size.biggap = size.biggap, n.comp = n.comp, tresh.fill = tresh.fill,
#                M = M, process.type = process.type)
    
    
    
    ##example settings for 3 steps, stepwise and mono dimensional
    dimensions       = list(list('time'), list('time'), list('time'))
    amnt.iters       = list(list(c(1,5)), list(c(2,5)), list(c(3,5)))
    amnt.iters.start = list(list(c(1,1)), list(c(2,1)), list(c(3,1)))
    amnt.artgaps     = list(list(c(0,0)), list(c(0,0)), list(c(0,0)))
    size.biggap      = list(list(0),      list(0),      list(0))
    n.comp           = list(list(6),      list(6),      list(6))
    M                = list(list(12),     list(12),     list(12))
    process.type     = 'stepwise'
#    gapfillNcdf(file.name = file.name, dimensions = dimensions, amnt.iters = amnt.iters, 
#                amnt.iters.start = amnt.iters.start, amnt.artgaps = amnt.artgaps, 
#                size.biggap = size.biggap, n.comp = n.comp, tresh.fill = tresh.fill,
#                M = M, process.type = process.type)
    
    ##example settings for 4 steps, stepwise and alternating between temporal and spatial
    dimensions       = list(list('time'), list(c('longitude','latitude')),
      list('time'), list(c('longitude','latitude')))
    amnt.iters       = list(list(c(1,5)), list(c(1,5)), list(c(2,5)), list(c(2,5)))
    amnt.iters.start = list(list(c(1,1)), list(c(1,1)), list(c(2,1)), list(c(2,1)))
    amnt.artgaps     = list(list(c(0,0)), list(c(0,0)), list(c(0,0)), list(c(0,0)))
    size.biggap      = list(list(0),      list(0), list(0),      list(0))
    n.comp           = list(list(15),     list(15), list(15),     list(15))
    M                = list(list(23),     list(c(20,20)), list(23), list(c(20,20)))
    process.type     = 'stepwise'
#    gapfillNcdf(file.name = file.name, dimensions = dimensions, 
#                amnt.iters = amnt.iters, amnt.iters.start = amnt.iters.start, 
#                amnt.artgaps = amnt.artgaps, size.biggap = size.biggap, n.comp = n.comp, 
#                tresh.fill = tresh.fill, M = M, process.type = process.type, max.cores = max.cores)
    
    ##example setting for process with alternating dimensions but variance criterium
    dimensions       = list(list('time', c('longitude','latitude')))
    n.comp           = list(list(5,      5))
    M                = list(list(10,     c(10, 10)))
    amnt.artgaps     = list(list(c(0,0), c(0,0)))
    size.biggap      = list(list(0,      0))
    process.type     = 'variances'
    max.steps        = 2
#    gapfillNcdf(file.name = file.name, dimensions = dimensions, n.comp = n.comp, 
#                tresh.fill = tresh.fill, max.steps = max.steps, M = M, 
#                process.type = process.type, amnt.artgaps = amnt.artgaps, 
#                size.biggap = size.biggap, max.cores = max.cores)



