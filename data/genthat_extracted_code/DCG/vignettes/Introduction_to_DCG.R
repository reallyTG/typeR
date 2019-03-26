## ------------------------------------------------------------------------
library(DCG)
head(monkeyGrooming)
symmetricAdjacencyMatrix <- as.symmetricAdjacencyMatrix(monkeyGrooming, weighted = TRUE, rule = "weak")

Sim <- as.SimilarityMatrix(symmetricAdjacencyMatrix)



## ------------------------------------------------------------------------

set.seed(18) # This ensure we get the same results when sampling temperares. It is not required. 

temperatures <- temperatureSample(start = 0.01, end = 10, n = 30, method = 'fixedInterval') 



## ------------------------------------------------------------------------
Ens_list <- getEnsList(simMat = Sim, temperatures = temperatures, MaxIt = 5, m = 5)

## ----fig.width=6, fig.height=4,echo=FALSE--------------------------------
imgStep1 <- png::readPNG("./step1.png")
grid::grid.raster(imgStep1)

## ----fig.width=6, fig.height=4,echo=FALSE--------------------------------
imgEigenvalue <- png::readPNG("./eigenvalueplot-example.png")
grid::grid.raster(imgEigenvalue)

## ----fig.width=6, fig.height=4,echo=FALSE--------------------------------
img <- png::readPNG("./step2.png")
grid::grid.raster(img)

## ---- fig.width=7, fig.height=8------------------------------------------
plotTheCluster(Ens_list, 2)

