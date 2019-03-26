library(GGally)


### Name: add_and_overwrite_aes
### Title: Add new aes
### Aliases: add_and_overwrite_aes
### Keywords: internal

### ** Examples

data(diamonds, package="ggplot2")
diamonds.samp <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
pm <- ggpairs(diamonds.samp, columns = 5:7,
  mapping = ggplot2::aes(color = color),
  upper = list(continuous = "cor", mapping = ggplot2::aes_string(color = "clarity")),
  lower = list(continuous = "cor", mapping = ggplot2::aes_string(color = "cut")),
  title = "Diamonds Sample"
)
str(pm)




