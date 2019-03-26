library(FIT)


### Name: FIT
### Title: FIT: a statistical modeling tool for transcriptome dynamics
###   under fluctuating field conditions
### Aliases: FIT FIT-package

### ** Examples

## Not run: 
##D # The following snippet shows the structure of a typical
##D # driver script of the FIT package.
##D # See vignettes for examples of actual scripts that use FIT.
##D 
##D ##############
##D ## training ##
##D ##############
##D ## discretized parameter space (for 'gridsearch')
##D grid.coords <- list(
##D   clock.phase = seq(0, 23*60, 1*60),
##D   # :
##D   gate.radiation.amplitude = c(-5, 5)
##D )
##D 
##D ## create a training recipe
##D recipe <- FIT::make.recipe(c('temperature', 'radiation'),
##D                            init  = 'gridsearch',
##D                            init.data = grid.coords,
##D                            optim = c('lm'),
##D                            fit   = 'fit.lasso',
##D                            time.step = 10, 
##D                            opts =
##D                              list(lm    = list(maxit = 900),
##D                              lasso = list(maxit = 1000))
##D                            )
##D 
##D ## names of genes to construct models
##D genes <- c('Os12g0189300', 'Os02g0724000')
##D 
## End(Not run)


## Not run: 
##D ## load training data
##D training.attribute  <- FIT::load.attribute('attribute.2008.txt')
##D training.weather    <- FIT::load.weather('weather.2008.dat', 'weather')
##D training.expression <- FIT::load.expression('expression.2008.dat', 'ex', genes)
##D 
##D ## models will be a list of trained models (length: ngenes)
##D models <- FIT::train(training.expression,
##D                      training.attribute,
##D                      training.weather,
##D                      recipe)
##D 
## End(Not run)

################
## prediction ##
################

## Not run: 
##D ## load validation data
##D prediction.attribute  <- FIT::load.attribute('attribute.2009.txt');
##D prediction.weather    <- FIT::load.weather('weather.2009.dat', 'weather')
##D prediction.expression <- FIT::load.expression('expression.2009.dat', 'ex', genes)
##D 
##D ## predict
##D prediction.result <- FIT::predict(models[[1]],
##D                                  prediction.attribute,
##D                                  prediction.weather)
##D 
##D 
## End(Not run)




