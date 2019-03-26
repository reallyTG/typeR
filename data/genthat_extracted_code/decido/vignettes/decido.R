## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example-------------------------------------------------------------
library(decido)
x <- c(0, 0, 0.75, 1, 0.5, 0.8, 0.69)
y <- c(0, 1, 1, 0.8, 0.7, 0.6, 0)
(ind <- earcut(cbind(x, y)))


plot_ears(cbind(x, y), ind)

## ------------------------------------------------------------------------
## polygon with a hole
x <- c(0, 0, 0.75, 1, 0.5, 0.8, 0.69,
     0.2, 0.5, 0.5, 0.3, 0.2)
y <- c(0, 1, 1, 0.8, 0.7, 0.6, 0,
     0.2, 0.2, 0.4, 0.6, 0.4)
ind <- earcut(cbind(x, y), holes = 8)
plot_ears(cbind(x, y), ind)

## ------------------------------------------------------------------------
plot_ears(cbind(x, y), ind, col = "grey", border = NA)
text(x, y, labels = seq_along(x), pos = 2)


## ------------------------------------------------------------------------
## add another hole
x <- c(0, 0, 0.75, 1, 0.5, 0.8, 0.69,
     0.2, 0.5, 0.5, 0.3, 0.2,
      0.15, 0.23, 0.2)
y <- c(0, 1, 1, 0.8, 0.7, 0.6, 0,
     0.2, 0.2, 0.4, 0.6, 0.4,
      0.65, 0.65, 0.81)
ind <- earcut(cbind(x, y), holes = c(8, 13))
plot_ears(cbind(x, y), ind, col = "grey")


## ------------------------------------------------------------------------
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
title("triangle plot, two holes")
plot_holes(cbind(x, y), holes = c(5, 9), col = "grey")
title("path plot, two holes")

ind <- decido::earcut(cbind(x, y), holes = 5)
plot_ears(cbind(x, y), ind, col = "grey")
title("triangle plot, two holes as one")
plot_holes(cbind(x, y), holes = 5, col = "grey")
title("path plot, two holes as one")

## ------------------------------------------------------------------------
library(oz)
oz_ring <- oz::ozRegion(states = FALSE)
ring <- oz_ring$lines[[6]]
indices <- earcut(ring[c("x", "y")])
plot_ears(cbind(ring$x, ring$y), indices)

## ------------------------------------------------------------------------
vecrot <- function(x, k) {
  if (k < 0 || k > length(x)) warning("k out of bounds of 'x' index")
  k <- k %% length(x)
  ## from DescTools::VecRot
  rep(x, times = 2)[(length(x) - k + 1):(2 * length(x) - k)]
}

## ------------------------------------------------------------------------
x <- c(0, 0, 0.75, 1, 0.5, 0.8, 0.69)
y <- c(0, 1, 1, 0.8, 0.7, 0.6, 0)
(ind <- earcut(cbind(x, y)))

plot_ears(cbind(x, y), ind)
points(x[1], y[1], pch = 19, col = "firebrick")
title("original")
op <- par(mfrow = c(2, 3))
for (rot in head(seq_along(x), -1)) {
xx <- vecrot(x, rot); yy <- vecrot(y, rot)
ind <- earcut(cbind(xx, yy))
plot_ears(cbind(xx, yy), ind)
title(sprintf("rot %i", rot))
points(xx[1], yy[1], pch = 19, col = "firebrick")
}
par(op)



