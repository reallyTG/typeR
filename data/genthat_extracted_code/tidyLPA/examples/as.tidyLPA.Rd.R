library(tidyLPA)


### Name: as.tidyLPA
### Title: Convert Mplus output to object of class 'tidyLPA'
### Aliases: as.tidyLPA
### Keywords: internal

### ** Examples

## Not run: 
##D library(MplusAutomation)
##D createMixtures(classes = 1:4, filename_stem = "cars",
##D                model_overall = "wt ON drat;",
##D                model_class_specific = "wt;  qsec;",
##D                rdata = mtcars,
##D                usevariables = c("wt", "qsec", "drat"),
##D                OUTPUT = "standardized")
##D runModels(replaceOutfile = "modifiedDate")
##D cars_results <- readModels(filefilter = "cars")
##D results_tidyLPA <- as.tidyLPA(cars_results)
##D results_tidyLPA
##D plot(results_tidyLPA)
##D plot_profiles(results_tidyLPA) # Throws error; missing column 'Classes'
## End(Not run)



