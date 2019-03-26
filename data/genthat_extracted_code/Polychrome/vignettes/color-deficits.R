## ----opts, echo=FALSE----------------------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=5)

## ----pkgs----------------------------------------------------------------
library(Polychrome)

## ----rg, fig.cap="Common red-green palette."-----------------------------
rg <- colorRampPalette(c("red", "black", "green"))(64)
image(matrix(1:64), col=rg)

## ----deut, fig.cap="Deuteranopes' view of the common red-green palette."----
rg.deut <- colorDeficit(rg, "deut")
image(matrix(1:64), col=rg.deut)

## ----prot, fig.cap="Protanopes' view of the common red-green palette."----
rg.prot <- colorDeficit(rg, "prot")
image(matrix(1:64), col=rg.prot)

## ----trit, fig.cap="Tritanopes' view of the common red-green palette."----
rg.trit <- colorDeficit(rg, "trit")
image(matrix(1:64), col=rg.trit)

## ----alfa, fig.cap = "The 26-color alphabet palette."--------------------
alfa <- alphabet.colors(26)
swatch(alfa)

## ----adeut, fig.cap = "The 26-color alphabet palette, as seen by a deuteranope."----
alfa.deut <- colorDeficit(alfa, "deut")
swatch(alfa.deut)

## ----aprot, fig.cap = "The 26-color alphabet palette, as seen by a protanope."----
alfa.prot <- colorDeficit(alfa, "prot")
swatch(alfa.prot)

## ----atrit, fig.cap = "The 26-color alphabet palette, as seen by a tritanope."----
alfa.trit <- colorDeficit(alfa, "trit")
swatch(alfa.trit)

## ----cp1, fig.cap="A palette designed for deuteranopes."-----------------
cp <- createPalette(20, "#111111", target="deuteranope")
names(cp) <- colorNames(cp)
swatch(cp)

## ----cp2, fig.cap = "A palette designed for protanopes."-----------------
cp <- createPalette(20, "#111111", target="protanope")
names(cp) <- colorNames(cp)
swatch(cp)

## ----cp3, fig.cap = "A palette designed for tritanopes."-----------------
cp <- createPalette(20, "#111111", target="tritanope")
names(cp) <- colorNames(cp)
swatch(cp)

## ----dists---------------------------------------------------------------
p34 <- palette36.colors(36)[3:36]
names(p34) <- colorNames(p34)
p34.deut <- colorDeficit(p34, "deut")
p34.prot <- colorDeficit(p34, "prot")
p34.trit <- colorDeficit(p34, "trit")

## ----shift---------------------------------------------------------------
shift <- function(i, k=34) c(i, 1:(i-1), (1+i):k)
co <- shift(13)
pd <- computeDistances(p34.deut[co])
pp <- computeDistances(p34.prot[co])
pt <- computeDistances(p34.trit[co])

## ----score---------------------------------------------------------------
rd <- rank(pd)[order(names(pd))]
rp <- rank(pd)[order(names(pp))]
rt <- rank(pd)[order(names(pt))]
score <- 2*rd + 1.5*rp + rt

## ---- fig.width=8, fig.height=7, fig.cap="Color safe palette."-----------
x <- p34[names(rev(sort(score)))][1:10]
y <- colorDeficit(x, "deut")
z <- colorDeficit(x, "prot")
w <- colorDeficit(x, "trit")

opar <- par(mfrow=c(2,2))
swatch(x, main="Normal")
swatch(y, main="Deuteranope")
swatch(z, main="Protanope")
swatch(w, main="Tritanope")

## ---- echo=FALSE---------------------------------------------------------
par(opar)

