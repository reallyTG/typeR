library(ggbuildr)


### Name: build_plot
### Title: Incrementally build and save layers of a ggplot object into
###   numbered files
### Aliases: build_plot

### ** Examples

X <- rnorm(20)
Y <- X + rnorm(20)

set.seed(1)
pd <- data.frame(X, Y)
p <- ggplot(pd, aes(X, Y)) +
  geom_smooth() +
  geom_point()

# Plot smooth, and then point
build_plot(p, build_order = list(1, 2))

# Plot point, and then smooth, but preserve order (i.e, keep points on top)
build_plot(p, build_order = list(2, 1))

# Plot point, and then smooth, and draw smooth layer on top of point
build_plot(p, build_order = list(2, 1), preserve_order = FALSE)




