## ----setup, cache=FALSE, echo=FALSE, results="hide", include=FALSE-------
library(knitr)
library(rgl)
opts_chunk$set(cache=FALSE, autodep=FALSE, tidy=FALSE)
opts_knit$set(width=75)
knit_hooks$set(webgl = hook_webgl)

## ----pca1----------------------------------------------------------------
library(pca3d)
data(metabo)
pca <- prcomp(metabo[,-1], scale.=TRUE)
gr  <- factor(metabo[,1])
summary(gr)

## ----pca3d,results="hide"------------------------------------------------
pca3d(pca, group=gr)
snapshotPCA3d(file="first_plot.png")

## ----pca2d,fig.width=5,fig.height=5,results="hide"-----------------------
pca2d(pca, group=gr, legend="topleft")

## ------------------------------------------------------------------------
listShapes()

## ----ellipse1,results="hide"---------------------------------------------
pca3d(pca, group=gr, show.ellipses=TRUE,
  ellipse.ci=0.75, show.plane=FALSE)
snapshotPCA3d(file="ellipses.png")

## ----fig.width=5,fig.height=5--------------------------------------------
pca2d(pca, group=gr, biplot=TRUE, biplot.vars=3)

## ----fancy,results="hide",warning=FALSE----------------------------------
pca3d(pca, group=gr, fancy=TRUE)
snapshotPCA3d(file="fancy.png")

## ----fig.height=6,fig.width=6--------------------------------------------
pca2d(pca, group=gr, legend="bottomleft")

## ----fig.width=6,fig.height=6--------------------------------------------
l <- pca2d(pca, group=gr)
l
legend("topleft", l$groups, col=l$colors, pch=l$pch, box.lty=0)

