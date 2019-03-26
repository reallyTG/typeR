## ---- echo=FALSE---------------------------------------------------------
## block with some startup/background objects functions
library(umap)
iris.colors = c("#ff7f00", "#e377c2", "#17becf")
plot.iris = function(x, labels,
         main="A UMAP visualization of the Iris dataset",
         pad=0.02, cex=0.65, pch=19,
         cex.main=1, cex.legend=1) {

  layout = x$layout
  par(mar=c(0.2,0.7,1.2,0.7), ps=10)
  xylim = range(layout)
  xylim = xylim + ((xylim[2]-xylim[1])*pad)*c(-0.5, 0.5)
  plot(xylim, xylim, type="n", axes=F, frame=F)
  xylim = par()$usr
  rect(xylim[1], xylim[1], xylim[2], xylim[2], border="#aaaaaa", lwd=0.2)
  points(layout[,1], layout[,2], col=iris.colors[as.integer(labels)],
         cex=cex, pch=pch)
  mtext(side=3, main, cex=cex.main)

  labels.u = unique(labels)
  legend("topright", legend=as.character(labels.u),
         col=iris.colors[as.integer(labels.u)],
         bty="n", pch=pch, cex=cex.legend)
}

set.seed(123456)

## ------------------------------------------------------------------------
library(umap)
iris.data = iris[, grep("Sepal|Petal", colnames(iris))]

## ----umap.learn, eval=FALSE----------------------------------------------
#  iris.umap_learn = umap(iris.data, method="umap-learn")

## ----defaults, eval=FALSE------------------------------------------------
#  umap.defaults

## ----defaults2, eval=TRUE, echo=FALSE, collapse=TRUE---------------------
umap.defaults

## ----umap.learn.config, eval=FALSE---------------------------------------
#  ## should display a configuration summary
#  iris.umap_learn$config

## ----iris.foo, eval=FALSE------------------------------------------------
#  ## (not evaluated in vignette)
#  iris.foo = umap(iris.data, method="umap-learn", foo=4, n_epochs=100)
#  iris.foo$config

## ----iris.custom, eval=FALSE---------------------------------------------
#  ## (not evaluated in vignette)
#  iris.custom = umap(iris.data, method="umap-learn",
#                     umap_learn_args=c("n_neighbors", "n_epochs"))
#  iris.custom$config

## ------------------------------------------------------------------------
sessionInfo()

