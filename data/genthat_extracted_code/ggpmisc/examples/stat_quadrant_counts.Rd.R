library(ggpmisc)


### Name: stat_quadrant_counts
### Title: Number of observations in quadrants
### Aliases: stat_quadrant_counts

### ** Examples

library(ggplot2)
# generate artificial data
set.seed(4321)
x <- 1:100
y <- rnorm(length(x), mean = 10)
my.data <- data.frame(x, y)

ggplot(my.data, aes(x, y)) +
  geom_point() +
  stat_quadrant_counts()

ggplot(my.data, aes(x - 50, y - 10)) +
  geom_hline(yintercept = 0, colour = "blue") +
  geom_vline(xintercept = 0, colour = "blue") +
  geom_point() +
  stat_quadrant_counts(colour = "blue")

ggplot(my.data, aes(x - 50, y - 10)) +
  geom_hline(yintercept = 0, colour = "blue") +
  geom_point() +
  stat_quadrant_counts(colour = "blue", pool.along = "x")

ggplot(my.data, aes(x - 50, y - 10)) +
  geom_vline(xintercept = 0, colour = "blue") +
  geom_point() +
  stat_quadrant_counts(colour = "blue", pool.along = "y")

ggplot(my.data, aes(x - 50, y - 10)) +
  geom_point() +
  stat_quadrant_counts(quadrants = 0)




