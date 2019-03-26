library(R2MLwiN)


### Name: caterpillar
### Title: Draws a caterpillar plot (in MLwiN style).
### Aliases: caterpillar

### ** Examples


## Not run: 
##D library(R2MLwiN)
##D # NOTE: if MLwiN not saved where R2MLwiN defaults to:
##D # options(MLwiN_path = 'path/to/MLwiN vX.XX/')
##D # If using R2MLwiN via WINE, the path may look like:
##D # options(MLwiN_path = '/home/USERNAME/.wine/drive_c/Program Files (x86)/MLwiN vX.XX/')
##D 
##D # Example using tutorial dataset
##D data(tutorial, package = 'R2MLwiN')
##D (mymodel <- runMLwiN(normexam ~ 1 + (1 | school) + (1 | student),
##D                      estoptions = list(resi.store = TRUE),
##D                      data = tutorial))
##D 
##D # For each school, calculate the CIs...
##D residuals <- mymodel@residual$lev_2_resi_est_Intercept
##D residualsCI <- 1.96 * sqrt(mymodel@residual$lev_2_resi_var_Intercept)
##D residualsRank <- rank(residuals)
##D rankno <- order(residualsRank)
##D 
##D caterpillar(y = residuals[rankno], x = 1:65, qtlow = (residuals - residualsCI)[rankno],
##D            qtup = (residuals + residualsCI)[rankno], xlab = 'Rank', ylab = 'Intercept')
## End(Not run)




