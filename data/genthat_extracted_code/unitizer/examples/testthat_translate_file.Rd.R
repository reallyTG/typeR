library(unitizer)


### Name: testthat_translate_file
### Title: Convert a 'testthat' Test File to a 'unitizer'
### Aliases: testthat_translate_file testthat_translate_name
###   testthat_translate_dir testthat_translate_dir testthat_translate_name

### ** Examples

## Not run: 
##D library(testthat)  # required
##D testthat_translate_file("tests/testthat/test-random.R")
##D 
##D # Translate `dplyr` tests (assumes `dplyr` source is in './dplyr')
##D # Normally we would use default `state` value but we cannot in this case
##D # due to conflicting packages and setup
##D 
##D testthat_translate_dir(
##D   "dplyr/tests/testthat", state=unitizerStateSafe(par.env="dplyr")
##D )
##D # Make sure translation worked (checking one file here)
##D # *NOTE*: folder we are looking at has changed
##D 
##D review("dplyr/tests/unitizer/summarise.unitizer")
##D 
##D # Now we can unitize any time we change our code
##D 
##D unitize_dir(
##D   "dplyr/tests/unitizer", state=unitizerStateSafe(par.env="dplyr")
##D )
## End(Not run)



