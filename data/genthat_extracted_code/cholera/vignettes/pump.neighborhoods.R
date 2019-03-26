## ---- echo = FALSE, message = FALSE--------------------------------------
library(cholera)

## ---- fig.width = 5, fig.height = 5, fig.align = "center", message = FALSE----
plot(neighborhoodVoronoi())

## ---- fig.width = 5, fig.height = 5, fig.align = "center", message = FALSE----
plot(neighborhoodVoronoi(-7))

## ------------------------------------------------------------------------
# print(neighborhoodVoronoi()) or
neighborhoodVoronoi()

## ---- fig.width = 5, fig.height = 5, fig.align = "center", message = FALSE----
plot(neighborhoodWalking())

## ------------------------------------------------------------------------
# print(neighborhoodWalking()) or
neighborhoodWalking()

## ---- fig.width = 5, fig.height = 5, fig.align = "center", message = FALSE----
plot(neighborhoodWalking(case.set = "expected"))

## ---- fig.width = 5, fig.height = 5, fig.align = "center", message = FALSE----
plot(neighborhoodWalking(case.set = "expected"), type = "area.points")

## ---- fig.width = 5, fig.height = 5, fig.align = "center", message = FALSE----
streetNameLocator("marshall street", zoom = TRUE, highlight = FALSE,
  add.title = FALSE, radius = 0.5)
addNeighborhood()

## ---- fig.width = 5, fig.height = 5, fig.align = "center", message = FALSE----
plot(neighborhoodWalking(-6))

