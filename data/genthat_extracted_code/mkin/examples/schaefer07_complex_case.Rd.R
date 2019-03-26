library(mkin)


### Name: schaefer07_complex_case
### Title: Metabolism data set used for checking the software quality of
###   KinGUI
### Aliases: schaefer07_complex_case schaefer07_complex_results
### Keywords: datasets

### ** Examples

data <- mkin_wide_to_long(schaefer07_complex_case, time = "time")
model <- mkinmod(
  parent = list(type = "SFO", to = c("A1", "B1", "C1"), sink = FALSE),
  A1 = list(type = "SFO", to = "A2"),
  B1 = list(type = "SFO"),
  C1 = list(type = "SFO"),
  A2 = list(type = "SFO"), use_of_ff = "max")
  ## Not run: 
##D     fit <- mkinfit(model, data, quiet = TRUE)
##D     plot(fit)
##D     endpoints(fit)
##D   
## End(Not run)
 # Compare with the results obtained in the original publication
 print(schaefer07_complex_results)



