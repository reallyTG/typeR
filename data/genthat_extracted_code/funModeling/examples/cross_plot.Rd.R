library(funModeling)


### Name: cross_plot
### Title: Cross-plotting input variable vs. target variable
### Aliases: cross_plot

### ** Examples

## Not run: 
##D ## Example 1:
##D cross_plot(data=heart_disease, input="chest_pain", target="has_heart_disease")
##D 
##D ## Example 2: Disabling auto_binning:
##D cross_plot(data=heart_disease, input="oldpeak",
##D 		target="has_heart_disease", auto_binning=FALSE)
##D 
##D ## Example 3: Saving the plot into a folder:
##D cross_plot(data=heart_disease, input="oldpeak",
##D 		target="has_heart_disease", path_out = "my_folder")
##D 
##D ## Example 4: Running with multiple input variables at the same time:
##D cross_plot(data=heart_disease, input=c("age", "oldpeak", "max_heart_rate"),
##D 		target="has_heart_disease")
## End(Not run)



