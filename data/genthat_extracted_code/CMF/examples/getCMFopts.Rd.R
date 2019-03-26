library(CMF)


### Name: getCMFopts
### Title: Default options for CMF
### Aliases: getCMFopts

### ** Examples

CMF_options = getCMFopts()
CMF_options$iter.max = 500	#Change the number of iterations from default of 200 to 500.
CMF_options$useBias = FALSE	#Don't take row and column means into consideration.
#These options will be in effect when CMF_options is passed on to CMF.



