library(ggChernoff)


### Name: scale_smile_continuous
### Title: Scales for smiling and frowning
### Aliases: scale_smile_continuous scale_smile

### ** Examples

library(ggplot2)
p <- ggplot(iris) +
    aes(Sepal.Width, Sepal.Length, fill = Species, smile = Sepal.Length) +
    geom_chernoff()
p
p + scale_smile_continuous(midpoint = min)
p + scale_smile_continuous(range = c(-.5, 2))




