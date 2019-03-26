library(plsr)


### Name: plot_perm_distr
### Title: Plots null distributions constructed via permutation testing
### Aliases: plot_perm_distr

### ** Examples

plsr_obj = pls(rating_data,tracking_data,10,10)
plot_perm_distr(plsr_obj)
## No test: 
plot_perm_distr(plsr_obj,breaks=5,lwd=5 ,bar_col = "white", line_col = "green")
## End(No test)



