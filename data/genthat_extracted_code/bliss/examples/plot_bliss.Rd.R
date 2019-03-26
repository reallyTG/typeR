library(bliss)


### Name: plot_bliss
### Title: plot_bliss
### Aliases: plot_bliss

### ** Examples

## No test: 
data(data1)
data(param1)
# res_bliss1 <- fit_Bliss(data=data1,param=param1,verbose=TRUE)
## End(No test)
data(res_bliss1)
### Plot the BLiss estimate on a suitable grid
plot_bliss(res_bliss1$data$grids[[1]],
           res_bliss1$Bliss_estimate[[1]],lwd=2,bound=FALSE)



