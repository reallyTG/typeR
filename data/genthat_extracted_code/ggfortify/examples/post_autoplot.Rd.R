library(ggfortify)


### Name: post_autoplot
### Title: Post process for fortify. Based on 'ggplot2::qplot'
### Aliases: post_autoplot

### ** Examples

p <- qplot(Petal.Length, Petal.Width, data = iris)
ggfortify:::post_autoplot(p, xlim = c(1, 5), ylim = c(1, 5), log = 'xy', main = 'title',
                          xlab = 'x', ylab = 'y', asp = 1.5)



