library(sppmix)


### Name: plot_density
### Title: Plots a density or image
### Aliases: plot_density

### ** Examples

## No test: 
# plot a mixture of normals density
truemix <- rnormmix(m = 3, sig0 = .1, df = 5, xlim= c(0, 5), ylim = c(0, 5))
summary(truemix)
normdens=dnormmix(truemix, xlim = c(0, 5), ylim = c(0, 5))
#2d plots
plot_density(normdens, main="2d mixture density plot\nWindow=[0,5]x[0,5]")
#Contour plot
plot_density(normdens, contour=TRUE, main="2d mixture contour plot\nWindow=[0,5]x[0,5]")
## End(No test)




