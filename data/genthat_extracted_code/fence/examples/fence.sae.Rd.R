library(fence)


### Name: fence.sae
### Title: Fence model selection (Small Area Estmation)
### Aliases: fence.sae

### ** Examples

require(fence)
library(snow)
### example 1 ####
data("kidney")
data = kidney[-which.max(kidney$x),]     # Delete a suspicious data point #
data$x2 = data$x^2
data$x3 = data$x^3
data$x4 = data$x^4
data$D = data$sqrt.D.^2
plot(data$y ~ data$x)
full = y~x+x2+x3+x4
# Takes more than 5 seconds to run
# testfh = fence.sae(full, data, B=100, fence="adaptive", method="F-H", D = D)
# testfh$sel_model
# testfh$c



