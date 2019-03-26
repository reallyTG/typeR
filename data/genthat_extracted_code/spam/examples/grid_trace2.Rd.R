library(spam)


### Name: grid_trace2
### Title: Two trace plots and a scatter plot.
### Aliases: grid_trace2
### Keywords: plot trace plot grid

### ** Examples

grid_trace2(runif(500), runif(500),
            chain1_yaxis_at = seq(.2, 1, by = .2),
            chain1_lab = "chain1", chain2_lab = "chain2",
            main = "Uniform",
            lwd_lines = unit(.5, "mm"))



