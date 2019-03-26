library(WRTDStidal)


### Name: winsrch_grid
### Title: Evaluate half-window width combinations
### Aliases: winsrch_grid winsrch_grid.default

### ** Examples

## Not run: 
##D ##
##D # setup parallel backend
##D library(doParallel)
##D ncores <- detectCores() - 2 
##D registerDoParallel(cores = ncores)
##D 
##D # run search function using default search grid - takes a while
##D res <- winsrch_grid(tidobjmean)
##D 
##D # view the error surface 
##D library(ggplot2)
##D ggplot(res, aes(x = factor(mos), y = factor(yrs), fill = err)) +
##D    geom_tile() + 
##D    facet_wrap(~ flo) + 
##D    scale_x_discrete(expand = c(0, 0)) +
##D    scale_y_discrete(expand = c(0,0)) +
##D    scale_fill_gradientn(colours = gradcols()) 
##D 
##D # optimal combo
##D res[which.min(res$err), ]
##D 
##D ##
##D # create a custom search grid, e.g. years only
##D grid_in <- createsrch(mos = 1, yrs = seq(1, 10), flo = 1)
##D 
##D res <- winsrch_grid(tidobjmean, grid_in)
##D 
## End(Not run)



