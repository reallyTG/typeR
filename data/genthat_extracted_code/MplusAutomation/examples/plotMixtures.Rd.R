library(MplusAutomation)


### Name: plotMixtures
### Title: Create latent profile plots
### Aliases: plotMixtures
### Keywords: mixture mplus plot

### ** Examples

## Not run: 
##D createMixtures(classes = 1:4, filename_stem = "cars",
##D                model_overall = "wt ON drat;",
##D                model_class_specific = "wt;  qsec;",
##D                rdata = mtcars,
##D                usevariables = c("wt", "qsec", "drat"),
##D                OUTPUT = "standardized")
##D runModels(replaceOutfile = "modifiedDate")
##D cars_results <- readModels(filefilter = "cars")
##D plotMixtures(cars_results, rawdata = TRUE)
## End(Not run)
## Not run: 
##D plotMixtures(cars_results, variables = "wt")
## End(Not run)
## Not run: 
##D plotMixtures(cars_results, coefficients = "stdyx.standardized")
## End(Not run)



