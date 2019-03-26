library(itsadug)


### Name: plot_diff2
### Title: Plot difference surface based on model predictions.
### Aliases: plot_diff2 plotDiff2D

### ** Examples

data(simdat)
## Not run: 
##D m1 <- bam(Y ~ Group + te(Time, Trial, by=Group),
##D     data=simdat)
##D plot_diff2(m1, view=c('Time', 'Trial'), 
##D     comp=list(Group=c("Children", "Adults")))
## End(Not run)



