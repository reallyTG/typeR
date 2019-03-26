library(automap)


### Name: compare.cv
### Title: Comparing the results of cross-validations
### Aliases: compare.cv

### ** Examples

# Load the data
data(meuse)
coordinates(meuse) = ~x+y
data(meuse.grid)
gridded(meuse.grid) = ~x+y

# Perform cross-validation
kr.cv = autoKrige.cv(log(zinc)~1, meuse, model = c("Exp"), nfold = 10)
kr_dist.cv = autoKrige.cv(log(zinc)~sqrt(dist), meuse, 
       model = c("Exp"), nfold = 10)
kr_dist_ffreq.cv = autoKrige.cv(log(zinc)~sqrt(dist)+ffreq, 
       meuse, model = c("Exp"), nfold = 10)

# Compare the results
compare.cv(kr.cv, kr_dist.cv, kr_dist_ffreq.cv)
compare.cv(kr.cv, kr_dist.cv, kr_dist_ffreq.cv, 
           bubbleplots = TRUE)
compare.cv(kr.cv, kr_dist.cv, kr_dist_ffreq.cv, 
           bubbleplots = TRUE, col.names = c("OK","UK1","UK2"))
compare.cv(kr.cv, kr_dist.cv, kr_dist_ffreq.cv, 
           bubbleplots = TRUE, col.names = c("OK","UK1","UK2"), 
           plot.diff = TRUE)

# I recently added a new bubble plot that uses ggplot
# I find it preferable, note that it requires ggplot2.
## Not run: 
##D compare.cv(kr.cv, kr_dist.cv, kr_dist_ffreq.cv, 
##D            bubbleplots = TRUE, col.names = c("OK","UK1","UK2"), 
##D            ggplot = TRUE)
## End(Not run)



