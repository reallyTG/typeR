library(ggforce)


### Name: geom_sina
### Title: Sina plot
### Aliases: geom_sina stat_sina

### ** Examples

ggplot(midwest, aes(state, area)) + geom_point()

# Boxplot and Violin plots convey information on the distribution but not the
# number of samples, while Jitter does the opposite.
ggplot(midwest, aes(state, area)) +
  geom_violin()

ggplot(midwest, aes(state, area)) +
  geom_jitter()

# Sina does both!
ggplot(midwest, aes(state, area)) +
  geom_violin() +
  geom_sina()

p <- ggplot(midwest, aes(state, popdensity)) +
  scale_y_log10()

p + geom_sina()

# Colour the points based on the data set's columns
p + geom_sina(aes(colour = inmetro))

# Or any other way
cols <- midwest$popdensity > 10000
p + geom_sina(colour = cols + 1L)

# Sina plots with continuous x:
ggplot(midwest, aes(cut_width(area, 0.02), popdensity)) +
  geom_sina() +
  scale_y_log10()


### Sample gaussian distributions
# Unimodal
a <- rnorm(500, 6, 1)
b <- rnorm(400, 5, 1.5)

# Bimodal
c <- c(rnorm(200, 3, .7), rnorm(50, 7, 0.4))

# Trimodal
d <- c(rnorm(200, 2, 0.7), rnorm(300, 5.5, 0.4), rnorm(100, 8, 0.4))

df <- data.frame(
  'Distribution' = c(
    rep('Unimodal 1', length(a)),
    rep('Unimodal 2', length(b)),
    rep('Bimodal', length(c)),
    rep('Trimodal', length(d))
  ),
  'Value' = c(a, b, c, d)
)

# Reorder levels
df$Distribution <- factor(
  df$Distribution,
  levels(df$Distribution)[c(3, 4, 1, 2)]
)

p <- ggplot(df, aes(Distribution, Value))
p + geom_boxplot()
p + geom_violin() +
  geom_sina()

# By default, Sina plot scales the width of the class according to the width
# of the class with the highest density. Turn group-wise scaling off with:
p +
  geom_violin() +
  geom_sina(scale = FALSE)



