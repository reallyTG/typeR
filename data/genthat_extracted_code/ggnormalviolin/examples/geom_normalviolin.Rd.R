library(ggnormalviolin)


### Name: geom_normalviolin
### Title: Creates normal violins with specified means and standard
###   deviations
### Aliases: geom_normalviolin

### ** Examples

library(ggplot2)
library(ggnormalviolin)

d <- data.frame(
  Distribution = c("A", "B"),
  Distribution_mean = c(80, 90),
  Distribution_sd = c(15, 10)
)

ggplot(data = d, aes(x = Distribution)) +
  geom_normalviolin(aes(mu = Distribution_mean,
                      sigma = Distribution_sd))



