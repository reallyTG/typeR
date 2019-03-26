library(quokar)


### Name: frame_fn_path
### Title: Visualization of the fitting path of quantile regression:
###   interior point method
### Aliases: frame_fn_path

### ** Examples

## Not run: 
##D library(ggplot2)
##D library(quantreg)
##D data(ais)
##D tau <- c(0.1, 0.5, 0.9)
##D object <-rq(BMI ~ LBM + Ht, tau = tau, data = ais, method = 'fn')
##D frame_fn <- frame_fn_path(object, tau)
##D #plot the path
##D frame_fn1 <- frame_fn[[1]]
##D ggplot(frame_fn1, aes(x = value, y = objective)) +
##D    geom_point() +
##D    geom_path() +
##D    facet_wrap(~ variable, scale = 'free')
## End(Not run)



