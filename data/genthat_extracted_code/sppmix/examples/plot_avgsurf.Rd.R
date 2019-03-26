library(sppmix)


### Name: plot_avgsurf
### Title: Plot the average intensity surface
### Aliases: plot_avgsurf

### ** Examples

## No test: 
truemix <- rnormmix(m = 5, sig0 = .1, df = 5, xlim= c(-1, 1), ylim =c(0, 3))
trueintsurf=to_int_surf(truemix, lambda = 200, win =spatstat::owin( c(-1, 1),c(0, 3)))
plot(trueintsurf, main = "True Poisson intensity surface (mixture of normal components)")
pp1 <- rsppmix(trueintsurf)
# Run Data augmentation MCMC and get posterior realizations
postfit=est_mix_damcmc(pp1,m=5)
# Plot the average of the surfaces of the posterior realizations
avgsurf=plot_avgsurf(postfit, LL = 50)
p<-plot_density(as.data.frame(avgsurf))+ggplot2::ggtitle(
 "Average surface of the posterior realization surfaces\n x denotes a true component mean")
#show the point pattern points
pp_df <- data.frame(pp1$x,pp1$y)
names(pp_df) <- c("x", "y")
p<-p + ggplot2::geom_point(data = pp_df,size=0.8)
#show the true means
mean_df <- data.frame(do.call(rbind, trueintsurf$mus))
names(mean_df) <- c("x", "y")
p + ggplot2::geom_point(data = mean_df, color = "red", shape = "x", size = 5)
#repeat for the contour plot
p<-plot_density(as.data.frame(avgsurf),contour = TRUE)+ggplot2::ggtitle(
 "Average surface of the posterior realization surfaces\n x denotes a true component mean")
#show the point pattern points
pp_df <- data.frame(pp1$x,pp1$y)
names(pp_df) <- c("x", "y")
p<-p + ggplot2::geom_point(data = pp_df,size=0.8)
#show the true means
mean_df <- data.frame(do.call(rbind, trueintsurf$mus))
names(mean_df) <- c("x", "y")
p + ggplot2::geom_point(data = mean_df, color = "red", shape = "x", size = 5)
#plot the 3d surface again based on the returned object
plotmix_3d(avgsurf,title1 = paste("Average of", .9*postfit$L,
 "posterior realizations of the intensity surface"))
## End(No test)




