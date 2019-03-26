library(ggChernoff)


### Name: geom_chernoff
### Title: Chernoff faces in ggplot2
### Aliases: geom_chernoff

### ** Examples

library(ggplot2)
ggplot(iris, aes(Sepal.Width, Sepal.Length, smile = Petal.Length, fill = Species)) +
  geom_chernoff()

ggplot(data.frame(x = 1:4,
                  y = c(3:1, 2.5),
                  z = factor(1:4),
                  w = rnorm(4),
                  n = c(rep(FALSE, 3), TRUE)
                  )) +
    aes(x, y, fill = z, size = x, nose = n, smile = w) +
    geom_chernoff()




