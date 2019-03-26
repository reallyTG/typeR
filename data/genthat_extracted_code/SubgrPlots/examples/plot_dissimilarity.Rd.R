library(SubgrPlots)


### Name: plot_dissimilarity
### Title: a plot for displaying dissimilarity distances of subgroups
### Aliases: plot_dissimilarity

### ** Examples

data(prca)
dat <- prca

## 1. dissimilarity plot ----------------------------------------------------
plot_dissimilarity(dat = dat,
                   covari.sel = c(4,5,6),
                   mode = 3,
                   range.ds = c(0,1),
                   font.size = c(1, 0.9, 1, 0.7),
                   title = NULL,
                   lab.x = "Dissimilarity distance")




