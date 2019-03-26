library(SubgrPlots)


### Name: plot_overlap
### Title: A graphical display for showing relative proportions of pairwise
###   subgroup overlap with two unidirectional arrowed curved lines around
###   a circle
### Aliases: plot_overlap

### ** Examples

# Load the data to be used
data(prca)
dat <- prca

## Overlap plot -------------------------------------------------------------
plot_overlap(dat = dat,
             covari.sel = c(6,5,4,7),
             para = c(0.1, 0.5, 1),
             font.size = c(1.2, 1.2, 0.8),
             title = NULL)



