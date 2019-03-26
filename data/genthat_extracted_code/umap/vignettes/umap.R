## ---- echo=FALSE---------------------------------------------------------
## block with some startup/background objects functions
library(umap)

iris.colors = c("#1f77b4", "#d62728", "#7f7f7f")
iris.colors = c("#ff7f00", "#e377c2", "#17becf")
plot.iris = function(x, labels,
         main="A UMAP visualization of the Iris dataset",
         pad=0.1, cex=0.65, pch=19, add=FALSE, legend.suffix="",
         cex.main=1, cex.legend=1) {

  layout = x
  if (class(x)=="umap") {
    layout = x$layout
  } 
  
  xylim = range(layout)
  xylim = xylim + ((xylim[2]-xylim[1])*pad)*c(-0.5, 0.5)
  if (!add) {
    par(mar=c(0.2,0.7,1.2,0.7), ps=10)
    plot(xylim, xylim, type="n", axes=F, frame=F)
    rect(xylim[1], xylim[1], xylim[2], xylim[2], border="#aaaaaa", lwd=0.25)  
  }
  points(layout[,1], layout[,2], col=iris.colors[as.integer(labels)],
         cex=cex, pch=pch)
  mtext(side=3, main, cex=cex.main)

  labels.u = unique(labels)
  legend.pos = "topright"
  legend.text = as.character(labels.u)
  if (add) {
    legend.pos = "bottomright"
    legend.text = paste(as.character(labels.u), legend.suffix)
  }
  legend(legend.pos, legend=legend.text,
         col=iris.colors[as.integer(labels.u)],
         bty="n", pch=pch, cex=cex.legend)
}

set.seed(123456)

## ------------------------------------------------------------------------
head(iris, 3)

## ------------------------------------------------------------------------
iris.data = iris[, grep("Sepal|Petal", colnames(iris))]
iris.labels = iris[, "Species"]

## ----iris.umap-----------------------------------------------------------
library(umap)
iris.umap = umap(iris.data)

## ----umap.print----------------------------------------------------------
iris.umap

## ----umap.layout---------------------------------------------------------
head(iris.umap$layout, 3)

## ---- fig.width=3.6, fig.height=3.6, dpi=150-----------------------------
plot.iris(iris.umap, iris.labels)

## ------------------------------------------------------------------------
iris.wnoise = iris.data + matrix(rnorm(150*40, 0, 0.1), ncol=4)
colnames(iris.wnoise) = colnames(iris.data)
head(iris.wnoise, 3)

## ------------------------------------------------------------------------
iris.wnoise.umap = predict(iris.umap, iris.wnoise)
head(iris.wnoise.umap, 3)

## ---- fig.width=3.6, fig.height=3.6, dpi=150-----------------------------
plot.iris(iris.umap, iris.labels)
plot.iris(iris.wnoise.umap, iris.labels, add=T, pch=4,
          legend.suffix=" (with noise)")

## ----defaults, eval=FALSE------------------------------------------------
#  umap.defaults

## ----defaults2, eval=TRUE, echo=FALSE, collapse=TRUE---------------------
umap.defaults

## ----custom.config, eval=TRUE--------------------------------------------
custom.config = umap.defaults
custom.config$random_state = 123

## ----custom2, fig.width=3.6, fig.height=3.6, dpi=150---------------------
iris.umap.2 = umap(iris.data, custom.config)
plot.iris(iris.umap.2, iris.labels,
          main="Another UMAP visualization (different seed)")

## ----custom3, eval=FALSE-------------------------------------------------
#  iris.umap.3 = umap(iris.data, random_state=123)

## ---- eval=FALSE---------------------------------------------------------
#  iris.umap.4 = umap(iris.data, method="umap-learn")

## ----show.plot.iris------------------------------------------------------
plot.iris

## ------------------------------------------------------------------------
sessionInfo()

