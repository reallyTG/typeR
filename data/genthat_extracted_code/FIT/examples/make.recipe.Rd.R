library(FIT)


### Name: make.recipe
### Title: Creates a recipe for training models.
### Aliases: make.recipe

### ** Examples

## Not run: 
##D init.params <- .. # choose them wisely
##D # Defined in Train.R:
##D # default.opts <- list(
##D #   none  = list(),
##D #   lm    = list(maxit=1500, nfolds=-1), # nfolds for lm is simply ignored
##D #   lasso = list(maxit=1000, nfolds=10)
##D # )
##D recipe <- FIT::make.recipe(c('wind', 'temperature'),
##D                            init = 'manual',
##D                            init.data = init.params,
##D                            optim = c('lm', 'none', 'lasso'),
##D                            fit = 'fit.lasso',
##D                            time.step = 10,
##D                            opts =
##D                              list(lm    = list(maxit = 900),
##D                                   lasso = list(maxit = 1000)))
## End(Not run)




