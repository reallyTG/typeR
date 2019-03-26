library(itsadug)


### Name: gamtabs
### Title: Convert model summary into Latex/HTML table for knitr/R Markdown
###   reports.
### Aliases: gamtabs

### ** Examples

data(simdat)
## Not run: 
##D # Model with random effect and interactions:
##D m1 <- bam(Y ~ Group+te(Time, Trial, by=Group),
##D     data=simdat)
##D summary(m1)
##D gamtabs(m1, caption='Summary of m1')
## End(Not run)
# See for more examples:
vignette("inspect", package="itsadug")



