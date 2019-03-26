library(BIGL)


### Name: optim.boxcox
### Title: Find optimal Box-Cox transformation parameters
### Aliases: optim.boxcox

### ** Examples

  data <- subset(directAntivirals, experiment == 1)
  optim.boxcox(data$effect, interaction(data$d1, data$d2))



