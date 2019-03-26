library(SubgrPlots)


### Name: plot_matrix_overlap
### Title: matrix plots for relative overlap proportions of pairwise
###   subgroups
### Aliases: plot_matrix_overlap

### ** Examples

# Load the data to be used
data(prca)
dat <- prca

## 1. Matrix Overlap plot ---------------------------------------------------
plot_matrix_overlap(dat,
                    covari.sel = c(6,5,4,7),
                    mode = 1,
                    font.size = c(1.5, 1.25, 0.8),
                    title = NULL)




