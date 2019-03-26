library(echo.find)


### Name: echo_find
### Title: Function to calculate the results for all genes using the
###   extended circadian harmonic oscillator (ECHO) method.
### Aliases: echo_find

### ** Examples

# for more elaboration, please see the vignette
# "expressions" is the example echo.find data frame
## No test: 
 # long example - commented out
echo_find(genes = expressions, begin = 2, end = 48, resol = 2,
  num_reps = 3, low = 20, high = 26, run_all_per = FALSE,
  paired = FALSE, rem_unexpr = FALSE, rem_unexpr_amt = 70, rem_unexpr_amt_below=0,
  is_normal = FALSE, is_de_linear_trend = FALSE, is_smooth = FALSE)
## End(No test)



