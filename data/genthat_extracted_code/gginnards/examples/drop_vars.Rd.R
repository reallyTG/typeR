library(gginnards)


### Name: drop_vars
### Title: Drop unused variables from data
### Aliases: drop_vars

### ** Examples

library(ggplot2)

p <- ggplot(mpg, aes(factor(year), (cty + hwy) / 2)) +
  geom_boxplot() +
  facet_grid(. ~ class)
p

p.dp <- drop_vars(p)
p.dp

object.size(p)
object.size(p.dp)

names(p$data)
names(p.dp$data)




