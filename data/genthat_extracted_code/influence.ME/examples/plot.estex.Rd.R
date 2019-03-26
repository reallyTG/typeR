library(influence.ME)


### Name: plot.estex
### Title: Dotplot visualization of measures of influence
### Aliases: plot.estex plot
### Keywords: hplot

### ** Examples

## Not run: 
##D data(school23)
##D model <- lmer(math ~ structure + SES  + (1 | school.ID), data=school23)
##D 
##D alt.est <- influence(model, "school.ID")
##D plot(alt.est, which="dfbetas")
##D plot(alt.est, which="cook", sort=TRUE)
## End(Not run)



