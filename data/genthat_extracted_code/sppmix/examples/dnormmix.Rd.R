library(sppmix)


### Name: dnormmix
### Title: Calculate the density or intensity of a normal mixture over a
###   fine grid
### Aliases: dnormmix

### ** Examples

## No test: 
truemix <- rnormmix(m = 3, sig0 = .1, df = 5,xlim= c(0, 5),
 ylim = c(0, 5))
normdens=dnormmix(truemix,xlim= c(0, 5), ylim = c(0, 5))
#2d plots
plot_density(as.data.frame(normdens))+ ggplot2::ggtitle(
 "2d mixture density plot\nWindow=[0,5]x[0,5]")
plot_density(as.data.frame(normdens),TRUE)+ ggplot2::ggtitle(
 "2d mixture contour plot\nWindow=[0,5]x[0,5]")
#3d plot
plotmix_3d(normdens)
#Now build an intensity surface based on the normal mixture
intsurf=to_int_surf(truemix,lambda = 100, win =
 spatstat::owin( c(0, 5),c(0, 5)))
intsurfdens=dnormmix(intsurf,xlim= c(0, 5), ylim = c(0, 5))
plot_density(as.data.frame(intsurfdens))+ ggplot2::ggtitle(
 "2d mixture intensity plot\nWindow=[0,5]x[0,5]")
plot_density(as.data.frame(intsurfdens),TRUE)+ ggplot2::ggtitle(
 "2d mixture intensity contour plot\nWindow=[0,5]x[0,5]")
plotmix_3d(normdens)#3d plot
#For an intensity surface object we use these functions instead
plotmix_2d(intsurf)
plot(intsurf)
## End(No test)




