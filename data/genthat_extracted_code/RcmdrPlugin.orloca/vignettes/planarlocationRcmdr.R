## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4
)
library(RcmdrPlugin.orloca)

## ----include = FALSE-----------------------------------------------------
loca1 <- data.frame(x=c(0, 4, 2), y=c(0, 0, 2), w=c(1, 1, 1))

## ------------------------------------------------------------------------
loca2 <- rloca.p(n = 100, xmin = 0, xmax = 10, ymin = 0, ymax = 10, groups = 3)
loca2 <- as(loca2, "data.frame")

## ------------------------------------------------------------------------
summary(loca1)

## ------------------------------------------------------------------------
distsum(as(loca1, "loca.p"), x = 3, y = 1) # Weighted sum of the distances
distsumgra(as(loca1, "loca.p"), x = 3, y = 1) # Gradient of the weighted sum function of the distances

## ------------------------------------------------------------------------
.sol <- distsummin(as(loca1, "loca.p"), x = 0, y = 0, eps = 0.001, algorithm = "Weiszfeld") # Solve the location problem minsum
.sol # Show the solution
distsum(as(loca1, "loca.p"), x = 2.00000022259505, y = 1.15332010901434) # Weighted sum of the distances
remove(.sol)

## ------------------------------------------------------------------------
plot(as(loca1, "loca.p"), main = "Graph of the set of points loca1")

## ------------------------------------------------------------------------
contour(as(loca1, "loca.p"), main = "Graph of the contours of the objective function for loca1")

## ------------------------------------------------------------------------
plot(as(loca1, "loca.p"), main = "Demand points and level curves for loca1")
contour(as(loca1, "loca.p"), add = T)

## ------------------------------------------------------------------------
persp(as(loca1, "loca.p"), main = "3D graph of the objective function min-sum for loca1")

## ------------------------------------------------------------------------
contour(as(loca1, "loca.p"), main = "Graph of the level curves of the objective function for loca1 \n (Standard lp = 2.5)", lp = 2.5)

