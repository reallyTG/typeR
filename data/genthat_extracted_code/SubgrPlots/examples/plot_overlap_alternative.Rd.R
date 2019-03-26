library(SubgrPlots)


### Name: plot_overlap_alternative
### Title: a graphical display for showing relative proportions of pairwise
###   subgroup overlap with two unidirectional arrowed lines around two
###   circle
### Aliases: plot_overlap_alternative

### ** Examples

data(prca)
dat <- prca
## 1. Overlap alternative plot -------------------------------------------------
plot_overlap_alternative(dat = dat,
                         covari.sel = c(6,5,4,7),
                         mode = 1,
                         para = c(0, 0.6, 1),
                         font.size = c(1.2, 1.2, 0.8),
                         title = NULL)




