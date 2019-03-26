library(ggplot2)


### Name: stat_unique
### Title: Remove duplicates
### Aliases: stat_unique

### ** Examples

ggplot(mtcars, aes(vs, am)) +
  geom_point(alpha = 0.1)
ggplot(mtcars, aes(vs, am)) +
  geom_point(alpha = 0.1, stat = "unique")



