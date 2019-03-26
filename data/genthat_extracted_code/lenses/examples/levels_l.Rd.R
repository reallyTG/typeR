library(lenses)


### Name: levels_l
### Title: Levels lens
### Aliases: levels_l
### Keywords: datasets

### ** Examples

x <- factor(c("a", "b"))
view(x, levels_l)
set(x, levels_l, c("A", "B"))



