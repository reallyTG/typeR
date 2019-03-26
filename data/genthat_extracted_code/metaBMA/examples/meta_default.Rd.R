library(metaBMA)


### Name: meta_default
### Title: Defaults for Model Averaging in Meta-Analysis
### Aliases: meta_default

### ** Examples

## Not run: 
##D data(towels)
##D d1 <- meta_default(towels$logOR, towels$SE, towels$study,
##D                    field = "psych", effect = "logOR",
##D                    sample = 5000)
##D d1
##D plot_forest(d1)
## End(Not run)



