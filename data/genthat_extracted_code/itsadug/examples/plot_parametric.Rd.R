library(itsadug)


### Name: plot_parametric
### Title: Visualization of group estimates.
### Aliases: plot_parametric

### ** Examples

data(simdat)
## Not run: 
##D m1 <- bam(Y ~ Group + te(Time, Trial, by=Group)
##D     + s(Time, Subject, bs='fs', m=1), data=simdat)
##D plot_parametric(m1, pred=list(Group=c('Adults', 'Children')))
##D # Note the summary that is printed.
##D 
##D # use rm.ranef to cancel random effects:
##D plot_parametric(m1, pred=list(Group=c('Adults', 'Children')),
##D     rm.ranef = TRUE)
##D 
##D # It is possible to get estimates that do not make sense:
##D out <- plot_parametric(m1, 
##D     pred=list(Group=c('Adults', 'Children'), Subject=c('a01', 'a02', 'c01')))
##D print(out)
## End(Not run)

# see the vignette for examples:
vignette("overview", package="itsadug")



