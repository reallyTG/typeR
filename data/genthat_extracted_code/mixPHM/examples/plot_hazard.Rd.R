library(mixPHM)


### Name: plot_hazard
### Title: Plot functions
### Aliases: plot_hazard plot_profile plot_survival
### Keywords: hplot

### ** Examples


##Plots for mixture Weibull model with 3 components
data(webshop)
res <- phmclust(webshop, 3)

##Hazard plot for first and third group, all pages
plot_hazard(res, gr.subset = c(1,3), group = TRUE, xlab = "Dwell Time")

##Survival plot for each group, first 6 pages
plot_survival(res, var.subset= 1:6, group = FALSE, xlab = "Dwell Time")

##Cluster profile plot
plot_profile(res, xlab = "Pages", ylab = "Mean Dwell Time", main = "Cluster Profile")




