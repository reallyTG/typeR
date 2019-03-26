library(ggdistribute)


### Name: geom_posterior
### Title: Geom for plotting posterior distributions
### Aliases: geom_posterior GeomPosterior stat_density_ci

### ** Examples

## No test: 
library(ggplot2)

x <- data_normal_sample(mu = c(-1, 0, 1), n = 500)

p <- ggplot(x, aes(x = value))

p + geom_posterior()

p + geom_posterior(aes(y = Condition))

p + geom_posterior(aes(y = GroupScore, fill = Condition))

p + geom_posterior(aes(y = GroupScore, fill = Group),
brighten = c(1.3, 0, -1.3),
position = position_spread(
height=0.5,
padding = 0))

## End(No test)



