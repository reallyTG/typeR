library(decido)


### Name: earcut
### Title: Constrained polygon triangulation
### Aliases: earcut earcut.default

### ** Examples

## single ring polygon
x <- c(0, 0, 0.75, 1, 0.5, 0.8, 0.69)
y <- c(0, 1, 1, 0.8, 0.7, 0.6, 0)
(ind <- earcut(cbind(x, y)))
plot_ears(cbind(x, y), ind)

## polygon with a hole
x <- c(0, 0, 0.75, 1, 0.5, 0.8, 0.69,
     0.2, 0.5, 0.5, 0.3, 0.2)
y <- c(0, 1, 1, 0.8, 0.7, 0.6, 0,
     0.2, 0.2, 0.4, 0.6, 0.4)
ind <- earcut(cbind(x, y), holes = 8)
plot_ears(cbind(x, y), ind)

## 1) Notice how the hole begins at index 8,
## hence holes = 8 above, and holes = c(8, 13) below
plot_ears(cbind(x, y), ind, col = "grey", border = NA)
text(x, y, labels = seq_along(x), pos = 2)

## add another hole
x <- c(0, 0, 0.75, 1, 0.5, 0.8, 0.69,
     0.2, 0.5, 0.5, 0.3, 0.2,
      0.15, 0.23, 0.2)
y <- c(0, 1, 1, 0.8, 0.7, 0.6, 0,
     0.2, 0.2, 0.4, 0.6, 0.4,
      0.65, 0.65, 0.81)
ind <- earcut(cbind(x, y), holes = c(8, 13))
plot_ears(cbind(x, y), ind, col = "grey")
# simpler shape with more than one hole
# the two inside holes are open to each other
# (so we can use the same data for one hole or two)
x <- c(0, 0, 1, 1,
       0.4, 0.2, 0.2, 0.4,
       0.6, 0.8, 0.8, 0.6
)
y <- c(0, 1, 1, 0,
       0.2, 0.2, 0.4, 0.4,
       0.6, 0.6, 0.4, 0.4
)
ind <- decido::earcut(cbind(x, y), holes = c(5, 9))
plot_ears(cbind(x, y), ind, col = "grey")
plot_holes(cbind(x, y), holes = c(5, 9), col = "grey")
ind <- decido::earcut(cbind(x, y), holes = 5)
plot_ears(cbind(x, y), ind, col = "grey")
plot_holes(cbind(x, y), holes = 5, col = "grey")



