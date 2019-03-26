library(SubgrPlots)


### Name: plot_overlap2
### Title: a graphical display for showing relative proportions of pairwise
###   subgroup overlap with two unidirectional arrowed curved lines around
###   a circle
### Aliases: plot_overlap2

### ** Examples

# Load the data to be used
data(prca)
dat <- prca

plot_overlap2(dat = dat,
              covari.sel = c(6,5,4,7),
              para = c(0.05, 0.75, 1),
              font.size = c(1.2, 1.2, 0.8),
              title = NULL)




