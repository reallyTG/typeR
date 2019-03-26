library(bliss)


### Name: lines_bliss
### Title: lines_bliss
### Aliases: lines_bliss

### ** Examples

### Plot the BLiss estimate on a suitable grid
## No test: 
data(data1)
data(param1)
# res_bliss1 <- fit_Bliss(data=data1,param=param1,verbose=TRUE)
## End(No test)
data(res_bliss1)
### Plot the BLiss estimate on a suitable grid
plot_bliss(res_bliss1$data$grids[[1]],
           res_bliss1$Bliss_estimate[[1]],lwd=2,bound=FALSE)
lines_bliss(res_bliss1$data$grids[[1]],
            res_bliss1$Smooth_estimate[[1]],lty=2)



