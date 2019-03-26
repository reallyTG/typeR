library(ezknitr)


### Name: ezknitr_core
### Title: Knit Rmd or spin R files without the typical pain of working
###   directories
### Aliases: ezknit ezknitr_core ezspin

### ** Examples

## Not run: 
##D    tmp <- setup_ezknit_test()
##D    ezknit("R/ezknit_test.Rmd", wd = "ezknitr_test")
##D    ezknit("R/ezknit_test.Rmd", wd = "ezknitr_test",
##D           out_dir = "output", fig_dir = "coolplots",
##D           params = list(numPoints = 50))
##D    open_output_dir()
##D    unlink(tmp, recursive = TRUE, force = TRUE)
##D  
##D    tmp <- setup_ezspin_test()
##D    ezspin("R/ezspin_test.R", wd = "ezknitr_test")
##D    ezspin("R/ezspin_test.R", wd = "ezknitr_test",
##D           out_dir = "output", fig_dir = "coolplots",
##D           params = list(numPoints = 50), keep_rmd = TRUE)
##D    open_output_dir()
##D    unlink(tmp, recursive = TRUE, force = TRUE)
## End(Not run)



