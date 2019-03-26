library(corrr)


### Name: network_plot
### Title: Network plot of a correlation data frame
### Aliases: network_plot

### ** Examples

x <- correlate(mtcars)
network_plot(x)
network_plot(x, min_cor = .1)
network_plot(x, min_cor = .6)
network_plot(x, min_cor = .7, colors = c("red", "green"), legend = TRUE)



