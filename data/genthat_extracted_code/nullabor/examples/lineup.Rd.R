library(nullabor)


### Name: lineup
### Title: The line-up protocol.
### Aliases: lineup

### ** Examples

library(ggplot2)
ggplot(lineup(null_permute('mpg'), mtcars), aes(mpg, wt)) +
  geom_point() +
  facet_wrap(~ .sample)
ggplot(lineup(null_permute('cyl'), mtcars),
       aes(mpg, .sample, colour = factor(cyl))) +
       geom_point()



