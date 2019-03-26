## ----style, echo = FALSE, results = 'asis'---------------------------------
BiocStyle::markdown()

## ----loadData, echo = TRUE, message = FALSE, warning = FALSE---------------
library("pRoloc")
library("pRolocdata")

## Subset data for markers for example
data("hyperLOPIT2015")
hyperLOPIT2015 <- markerMSnSet(hyperLOPIT2015)

## ----queryparams-----------------------------------------------------------
params <- setAnnotationParams(inputs = c("Mus musculus",
										 "UniProtKB/Swiss-Prot ID"))

## ----addGO, echo = TRUE, message = FALSE, warning = FALSE, eval = TRUE-----
cc <- addGoAnnotations(hyperLOPIT2015, params,
					   namespace = "cellular_component")
fvarLabels(cc)

## ----filterGO, echo = TRUE, message = FALSE, warning = FALSE, eval = TRUE----
## Next we filter the GO term matrix removing any terms that have
## have less than `n` proteins or greater than `p` % of total proteins
## in the dataset (this removes terms that only have very few proteins
## and very general terms)
cc <- filterMinMarkers(cc)
cc <- filterMaxMarkers(cc)

## ----orderMarkers, eval = TRUE, verbose = FALSE----------------------------
## Extract markers can use n to specify to select top n terms
res <- orderGoAnnotations(cc, k = 1:3, p = 1/3, verbose = FALSE)

## ----viewGO, eval=FALSE----------------------------------------------------
#  library("pRolocGUI")
#  pRolocVis(res, fcol = "GOAnnotations")

## ----clusterDist, eval = TRUE, verbose = FALSE-----------------------------
## Now calculate distances
dd <- clustDist(cc, fcol = "GOAnnotations", k = 1:3, verbose = FALSE)
dd[[1]]

## ----visualiseRes, fig.width=12, eval = TRUE-------------------------------
## Plot normalised distances
plot(dd, p = 1/3)

## Examine kmeans clustering
plot(dd[[1]], cc)

## ----minRank, eval = FALSE-------------------------------------------------
#  ## Normalise by n^1/3
#  minDist <- getNormDist(dd, p = 1/3)
#  
#  ## Get new order according to lowest distance
#  o <- order(minDist)
#  
#  ## Re-order `GOAnnotations` matrix in `fData`
#  fData(cc)$GOAnnotations <- fData(cc)$GOAnnotations[, o]

## ----visAgain, eval=FALSE--------------------------------------------------
#  pRolocVis(cc, fcol = "GOAnnotations")

