## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4
)
library(RcmdrPlugin.orloca)

## ----include=FALSE-------------------------------------------------------
loca1 <- loca.p(c(0, 4, 2), c(0, 0, 2))

## ------------------------------------------------------------------------
loca2 <- rloca.p(n = 100, xmin = 0, xmax = 10, ymin = 0, ymax = 10, groups = 3)
loca2 <- as(loca2, "data.frame")

## ------------------------------------------------------------------------
summary(loca1)

## ------------------------------------------------------------------------
distsum(as(loca1, "loca.p") , x = 3, y = 1) # Suma ponderada de las distancias
distsumgra(as(loca1, "loca.p") , x = 3, y = 1) # Gradiente de la función suma ponderada de las distancias

## ------------------------------------------------------------------------
.sol <- distsummin(as(loca1, "loca.p") , x = 0, y = 0, eps =0.001, algorithm ="Weiszfeld" ) # Resolver el problema de localización minsum
.sol # Muestra la solución
distsum(as( loca1 , "loca.p") , x = 2.00000022259505 , y =  1.15332010901434 ) # Suma ponderada de las distancias
remove(.sol)

## ------------------------------------------------------------------------
plot(as(loca1, "loca.p"), main= "Gráfica del conjunto de puntos loca1")

## ------------------------------------------------------------------------
contour(as(loca1, "loca.p"), main="Gráfica de las curvas de nivel de la función objetivo para loca1")

## ------------------------------------------------------------------------
plot(as(loca1, "loca.p"), main= "Puntos de demanda y las curvas de nivel para loca1")
contour(as(loca1,"loca.p"), add=T)

## ------------------------------------------------------------------------
persp(as(loca1, "loca.p"), main="Gráfica 3D de la función objetivo min-sum para loca1")

## ------------------------------------------------------------------------
contour(as(loca1, "loca.p"), main="Gráfica de las curvas de nivel de la función objetivo para loca1\n(Norma lp = 2.5)",  lp = 2.5)

