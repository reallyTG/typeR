library(SubgrPlots)


### Name: plot_network
### Title: network overlap plot (only works for binary variables)
### Aliases: plot_network

### ** Examples

# Load the data to be used
data(prca)
dat <- prca

## 1. Network plot ---------------------------------------------------------------
plot_network(dat = dat,
             covari.sel = c(6,5,4,7),
             para = c(0.1, 0.5, 1),
             font.size = c(1.2, 1.2, 0.8),
             title = NULL)




