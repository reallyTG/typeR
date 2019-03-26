library(ezknitr)


### Name: setup_ezspin_test
### Title: Set up a test directory to experiment with 'ezspin' or 'ezknit'
### Aliases: setup_ezknit_test setup_ezspin_test setup_test

### ** Examples

## Not run: 
##D library(ezknitr)
##D 
##D # setup the test directory structures and run naive spin
##D setup_ezspin_test()
##D knitr::spin("ezknitr_test/R/ezspin_test.R")
##D file.remove(c("ezspin_test.md", "ezspin_test.html"))
##D 
##D # setup the test directory structures and run simple ezspin
##D setup_ezspin_test()
##D ezspin("R/ezspin_test.R", wd = "ezknitr_test")
##D 
##D # setup the test directory structures and run ezspin with more parameters
##D tmp <- setup_ezspin_test()
##D ezspin("R/ezspin_test.R", wd = "ezknitr_test",
##D         out_dir = "output", fig_dir = "coolplots")
##D unlink(tmp, recursive = TRUE, force = TRUE)
## End(Not run)



