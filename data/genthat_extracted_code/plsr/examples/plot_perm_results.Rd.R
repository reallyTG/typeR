library(plsr)


### Name: plot_perm_results
### Title: Plot permuation results for plsr object
### Aliases: plot_perm_results

### ** Examples

plsr_obj = pls(rating_data,tracking_data,10,10)
plot_perm_results(plsr_obj)
## No test: 
#plot with 0.10 as the significance threshold instead of the one specified by the plsr object
#and a thicker blue-colored line to indicate it
plot_perm_results(plsr_obj,lwd=5,col="blue", alpha=0.10)
## End(No test)



