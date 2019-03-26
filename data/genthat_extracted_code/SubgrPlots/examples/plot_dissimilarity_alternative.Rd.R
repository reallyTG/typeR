library(SubgrPlots)


### Name: plot_dissimilarity_alternative
### Title: An alternative plot for displaying dissimilarity distances of
###   subgroups
### Aliases: plot_dissimilarity_alternative

### ** Examples

data(prca)
dat <- prca
## 1. dissimilarity alternative plot ----------------------------------------
plot_dissimilarity_alternative(dat = dat,
                               covari.sel = c(4,5,6),
                               mode = 2,
                               range.ds = c(0,1),
                               font.size = c(1, 1, 0.7),
                               title = NULL,
                               lab.y = "Similarity distance")




