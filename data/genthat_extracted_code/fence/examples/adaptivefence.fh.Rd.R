library(fence)


### Name: adaptivefence.fh
### Title: Adaptive Fence model selection (Small Area Estmation)
### Aliases: adaptivefence.fh

### ** Examples

## Not run: 
##D require(fence)
##D ### example 1 ####
##D data("kidney")
##D data = kidney[-which.max(kidney$x),]     # Delete a suspicious data point #
##D data$x2 = data$x^2
##D data$x3 = data$x^3
##D data$x4 = data$x^4
##D data$D = data$sqrt.D.^2
##D plot(data$y ~ data$x)
##D full = y~x+x2+x3+x4
##D testfh = fence.sae(full, data, B=1000, fence="adaptive", method="F-H", D = D)
##D testfh$sel_model
##D testfh$c
## End(Not run)



