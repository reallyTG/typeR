## ----style, echo = FALSE, results = 'asis'---------------------------------
BiocStyle::markdown()

## ----env, include=FALSE, echo=FALSE, cache=FALSE---------------------------
library("knitr")
opts_chunk$set(stop_on_error = 1L)
suppressPackageStartupMessages(library("MSnbase"))
suppressWarnings(suppressPackageStartupMessages(library("pRoloc")))
suppressPackageStartupMessages(library("pRolocdata"))
suppressPackageStartupMessages(library("class"))
set.seed(1)

## ----libraries-------------------------------------------------------------
library("MSnbase")
library("pRoloc")
library("pRolocdata")

## ----setcols---------------------------------------------------------------
setStockcol(NULL) ## reset first
setStockcol(paste0(getStockcol(), 70))

## ----readCsvData0----------------------------------------------------------
## The original data for replicate 1, available
## from the pRolocdata package
f0 <- dir(system.file("extdata", package = "pRolocdata"),
	  full.names = TRUE,
	  pattern = "pr800866n_si_004-rep1.csv")
csv <- read.csv(f0)

## ----showOrgCsv------------------------------------------------------------
head(csv, n=3)

## ----readCsvData1, tidy = FALSE--------------------------------------------
## The quantitation data, from the original data
f1 <- dir(system.file("extdata", package = "pRolocdata"),
	  full.names = TRUE, pattern = "exprsFile.csv")
exprsCsv <- read.csv(f1)
## Feature meta-data, from the original data
f2 <- dir(system.file("extdata", package = "pRolocdata"),
	  full.names = TRUE, pattern = "fdataFile.csv")
fdataCsv <- read.csv(f2)
## Sample meta-data, a new file
f3 <- dir(system.file("extdata", package = "pRolocdata"),
	  full.names = TRUE, pattern = "pdataFile.csv")
pdataCsv <- read.csv(f3)

## ----showExprsFile---------------------------------------------------------
head(exprsCsv, n=3)

## ----showFdFile------------------------------------------------------------
head(fdataCsv, n=3)

## ----showPdFile------------------------------------------------------------
pdataCsv

## ----makeMSnSet------------------------------------------------------------
tan2009r1 <- readMSnSet(exprsFile = f1,
			featureDataFile = f2,
			phenoDataFile = f3,
			sep = ",")
tan2009r1

## ----readMSnSet2-----------------------------------------------------------
ecol <- paste("area", 114:117, sep = ".")
fname <- "Protein.ID"
eset <- readMSnSet2(f0, ecol, fname)
eset

## ----ecols-----------------------------------------------------------------
getEcols(f0, ",")
grepEcols(f0, "area", ",")
e <- grepEcols(f0, "area", ",")
readMSnSet2(f0, e)

## ----showSubset------------------------------------------------------------
smallTan <- tan2009r1[1:5, 1:2]
dim(smallTan)
exprs(smallTan)

## ----rmtan, echo=FALSE-----------------------------------------------------
## remove manullay constructred data
rm(tan2009r1)
data(tan2009r1)

## ----loadTan1--------------------------------------------------------------
data(tan2009r1)

## ----lookAtTan-------------------------------------------------------------
getMarkers(tan2009r1, fcol = "markers.orig")
getMarkers(tan2009r1, fcol = "PLSDA")

## ----markers---------------------------------------------------------------
pRolocmarkers()
head(pRolocmarkers("dmel"))
table(pRolocmarkers("dmel"))

## ----realtiveQuants--------------------------------------------------------
summary(rowSums(exprs(tan2009r1)))

## ----norm, echo=TRUE, message=FALSE, cache=TRUE----------------------------
## create a small illustrative test data
data(itraqdata)
itraqdata <- quantify(itraqdata, method = "trap",
			  reporters = iTRAQ4)
## the quantification data
head(exprs(itraqdata), n = 3)
summary(rowSums(exprs(itraqdata)))
## normalising to the sum of feature intensitites
itraqnorm <- normalise(itraqdata, method = "sum")
processingData(itraqnorm)
head(exprs(itraqnorm), n = 3)
summary(rowSums(exprs(itraqnorm)))

## ----featurenames----------------------------------------------------------
head(featureNames(tan2009r1))

## ----showplotdist, echo=TRUE, eval=FALSE-----------------------------------
#  ## indices of the mito markers
#  j <- which(fData(tan2009r1)$markers.orig == "mitochondrion")
#  ## indices of all proteins assigned to the mito
#  i <- which(fData(tan2009r1)$PLSDA == "mitochondrion")
#  plotDist(tan2009r1[i, ],
#  	 markers = featureNames(tan2009r1)[j])

## ----plotdist1, echo=FALSE, fig.cap="Distribution of protein intensities along the fractions of the separation gradient for 4 organelles: mitochondrion (red), ER/Golgi (blue, ER markers and green, Golgi markers) and plasma membrane (purple)."----
par(mfrow = c(2,2), mar = c(4, 4, 2, 0.1))
cls <- getStockcol()[1:4]
plotDist(tan2009r1[which(fData(tan2009r1)$PLSDA == "mitochondrion"), ],
	 markers = featureNames(tan2009r1)
	 [which(fData(tan2009r1)$markers.orig == "mitochondrion")],
	 mcol = cls[1])
title(main = "mitochondrion")
plotDist(tan2009r1[which(fData(tan2009r1)$PLSDA == "ER/Golgi"), ],
	 markers = featureNames(tan2009r1)
	 [which(fData(tan2009r1)$markers.orig == "ER")],
	 mcol = cls[2])
title(main = "ER")
plotDist(tan2009r1[which(fData(tan2009r1)$PLSDA == "ER/Golgi"), ],
	 markers = featureNames(tan2009r1)
	 [which(fData(tan2009r1)$markers.orig == "Golgi")],
	 mcol = cls[3])
title(main = "Golgi")
plotDist(tan2009r1[which(fData(tan2009r1)$PLSDA == "PM"), ],
	 markers = featureNames(tan2009r1)
	 [which(fData(tan2009r1)$markers.orig == "PM")],
	 mcol = cls[4])
title(main = "PM")

## ----dendro, fig.cap="Hierarchical clustering. Average distance between organelle classes."----
mrkHClust(tan2009r1)

## ----plotavrprof, fig.cap="Average organelle class profiles. Protein intensity indicated by colour. Organelle classes ordered by hierarchical clustering"----
## histogram
hc <- mrkHClust(tan2009r1, plot=FALSE)

## order of markers according to histogram
mm <- getMarkerClasses(tan2009r1)
m_order <- levels(factor(mm))[order.dendrogram(hc)]

## average marker profile
fmat <- mrkConsProfiles(tan2009r1)

plotConsProfiles(fmat, order=m_order)

## ----plot2d, echo=TRUE, fig.asp=1, fig.cap="PCA plot. Representation of the proteins of `tan2009r1` after reduction of the 4 reporter quantitation data to 2 principal components."----
plot2D(tan2009r1, fcol = "markers")
addLegend(tan2009r1, fcol = "markers", cex = .7,
	  where = "bottomright", ncol = 2)

## ----plot2dorg, echo=TRUE, fig.asp=1, fig.cap="PCA plot. Reduced set of markers for the `tan2009r1` data projected onto 2 principal components."----
plot2D(tan2009r1, fcol = "markers.orig")
addLegend(tan2009r1, fcol = "markers.orig", where = "bottomright")

## ----plot3Danim, echo=FALSE, eval=FALSE------------------------------------
#  ## here's how the animation below was created
#  data(hyperLOPIT2015)
#  suppressPackageStartupMessages(library("rgl"))
#  plot3D(hyperLOPIT2015)
#  movie3d(spin3d(c(1, 1, 1), rpm = 10), duration = 5,
#  	clean = FALSE,
#  	dir = "~/dev/00_github/pRoloc/vignettes/Figures/")

## ----plot3D, eval = FALSE--------------------------------------------------
#  plot3D(tan2009r1)

## ----scree0, echo=FALSE----------------------------------------------------
pcvar <- plot2D(tan2009r1, method = "scree", plot = FALSE)
pcvar <- round(pcvar, 2)

## ----scree, fig.cap="Percentage of variance explained."--------------------
plot2D(tan2009r1, method = "scree")

## ----tsne, eval=FALSE------------------------------------------------------
#  perps <- sort(c(30, seq(5, 50, 15)))
#  data(HEK293T2011)
#  par(mfrow = c(2, 3))
#  plot2D(HEK293T2011, main = "PCA")
#  sapply(perps,
#  	   function(perp) {
#  	   plot2D(HEK293T2011, method = "t-SNE",
#  		  methargs = list(perplexity = perp))
#  	   title(main = paste("t-SNE, perplexity", perp))
#  	   })

## ----foi0------------------------------------------------------------------
foi1 <- FeaturesOfInterest(description = "Feats of interest 1",
			   fnames = featureNames(tan2009r1[1:10]))
description(foi1)
foi(foi1)

## --------------------------------------------------------------------------
foi2 <- FeaturesOfInterest(description = "Feats of interest 2",
			   fnames = featureNames(tan2009r1[880:888]))
foic <- FoICollection(list(foi1, foi2))
foic

## ----plotfoi, fig.asp=1, fig.cap="Adding features of interest on a PCA plot."----
plot2D(tan2009r1, fcol = "PLSDA")
addLegend(tan2009r1, fcol = "PLSDA",
	  where = "bottomright",
	  cex = .7)
highlightOnPlot(tan2009r1, foi1,
		col = "black", lwd = 2)
highlightOnPlot(tan2009r1, foi2,
		col = "purple", lwd = 2)
legend("topright", c("FoI 1", "FoI 2"),
	   bty = "n", col = c("black", "purple"),
	   pch = 1)

## ----guiinstall, eval = FALSE----------------------------------------------
#  library("BiocManager")
#  BiocManager::install("pRolocGUI")
#  library("pRolocGUI")
#  pRolocVis(tan2009r1)

## ----qsep------------------------------------------------------------------
library("pRolocdata")
data(hyperLOPIT2015)

## Create the object and get a summary
hlq <- QSep(hyperLOPIT2015)
hlq
levelPlot(hlq)
plot(hlq)

## ----plot2dnull, echo=TRUE, fig.cap="Plain PCA representation of the `tan2009r1` data."----
plot2D(tan2009r1, fcol = NULL)

## ----plotKmeans, echo=TRUE, fig.asp=1, fig.cap="k-means clustering on the `tan2009r1` data."----
kcl <- MLearn( ~ ., tan2009r1,  kmeansI, centers=5)
plot(kcl, exprs(tan2009r1))

## ----plotHclust, echo=TRUE, tidy = FALSE, fig.asp=1, fig.cap="Hierarchical clustering on the `tan2009r1` data."----
hcl <- MLearn( ~ ., tan2009r1,
		  hclustI(distFun = dist,
			  cutParm = list(k = 5)))
plot(hcl, labels = FALSE)

## ----plotPam, echo=TRUE, fig.asp=1, fig.cap="Partitioning around medoids on the `tan2009r1` data."----
pcl <- MLearn( ~ ., tan2009r1,  pamI(dist), k = 5)
plot(pcl, data = exprs(tan2009r1))

## ----svmParamOptim, eval = FALSE, message = FALSE, tidy=FALSE--------------
#  params <- svmOptimisation(tan2009r1, fcol = "markers.orig",
#  			  times = 100, xval = 5,
#  			  verbose = FALSE)

## ----loadParams, echo = TRUE-----------------------------------------------
fn <- dir(system.file("extdata", package = "pRoloc"),
	  full.names = TRUE, pattern = "params.rda")
load(fn)

## ----showParams------------------------------------------------------------
params

## ----params, echo=TRUE, fig.cap="Assessing parameter optimisation. On the left, we see the respective distributions of the 10 macro F1 scores for the best cost/sigma parameter pairs. See also the output of *f1Count* in relation to this plot. On the right, we see the averaged macro F1 scores, for the full range of parameter values."----
plot(params)
levelPlot(params)

## ----f1count---------------------------------------------------------------
f1Count(params)
getParams(params)

## ----svmRes0, warning=FALSE, eval = FALSE, tidy = FALSE--------------------
#  ## manual setting of parameters
#  svmres <- svmClassification(tan2009r1, fcol = "markers.orig",
#  				sigma = 1, cost = 1)

## ----svmRes, warning=FALSE, tidy = FALSE-----------------------------------
## using default best parameters
svmres <- svmClassification(tan2009r1, fcol = "markers.orig",
				assessRes = params)
processingData(svmres)
tail(fvarLabels(svmres), 4)

## ----getPredictions--------------------------------------------------------
p1 <- getPredictions(svmres, fcol = "svm")
p1 <- fData(p1)$svm.pred
minprob <- median(fData(svmres)$svm.scores)
p2 <- getPredictions(svmres, fcol = "svm", t = minprob)
p2 <- fData(p2)$svm.pred
table(p1, p2)

## ----predscores, fig.cap="Organelle-specific SVM score distributions."-----
boxplot(svm.scores ~ svm, data = fData(svmres),
	ylab = "SVM scores")
abline(h = minprob, lwd = 2, lty = 2)

## ----medscores2, tidy = FALSE----------------------------------------------
ts <- orgQuants(svmres, fcol = "svm", t = .5)

## ----medscorepreds, tidy = FALSE-------------------------------------------
getPredictions(svmres, fcol = "svm", t = ts)

## ----svmres, fig.asp=1, fig.cap="Representation of the svm prediction on the `tan2009r1` data set. The svm scores have been used to set the point size (`cex` argument; the scores have been transformed to emphasise the extremes). Different symbols (`fpch`) are used to differentiate markers and new assignments."----
ptsze <- exp(fData(svmres)$svm.scores) - 1
plot2D(svmres, fcol = "svm", fpch = "markers.orig",
	   cex = ptsze)
addLegend(svmres, fcol = "svm",
	  where = "bottomright",
	  cex = .5)

## ----runPhenoDisco, eval=FALSE, warning=FALSE------------------------------
#  pdres <- phenoDisco(tan2009r1, GS = 10,
#  			times = 100, fcol = "PLSDA")

## ----loadpdres, echo=TRUE--------------------------------------------------
fn <- dir(system.file("extdata", package = "pRoloc"),
	  full.names = TRUE, pattern = "pdres.rda")
load(fn)

## ----phenoDiscoFvar--------------------------------------------------------
processingData(pdres)
tail(fvarLabels(pdres), 3)

## ----pdres, echo=TRUE, fig.asp=1, fig.cap="Representation of the phenoDisco prediction and cluster discovery results."----
plot2D(pdres, fcol = "pd")
addLegend(pdres, fcol = "pd", ncol = 2,
	  where = "bottomright",
	  cex = .5)

## ----pdmarkers-------------------------------------------------------------
getMarkers(tan2009r1, fcol = "pd.markers")

## ----weights, eval = TRUE, echo = TRUE-------------------------------------
w <- classWeights(tan2009r1, fcol = "pd.markers")
w

## ----pdsvmParams, eval = FALSE, tidy = FALSE-------------------------------
#  params2 <- svmOptimisation(tan2009r1, fcol = "pd.markers",
#  			   times = 10, xval = 5,
#  			   class.weights = w,
#  			   verbose = FALSE)

## ----loadParams2, echo = TRUE----------------------------------------------
fn <- dir(system.file("extdata", package = "pRoloc"),
	  full.names = TRUE, pattern = "params2.rda")
load(fn)

## ----pdsvm, cache = TRUE, message = FALSE, warning = FALSE, tidy = FALSE----
tan2009r1 <- svmClassification(tan2009r1, params2,
				   class.weights = w,
				   fcol = "pd.markers")

## ----pdres2, fig.asp=1, fig.cap="Classification results. The results of the second round of classification, using the augmented set of markers obtained using *phenoDisco* as detailed in [@Breckels2013] and a weighted svm classifier."----
ptsze <- exp(fData(tan2009r1)$svm.scores) - 1
plot2D(tan2009r1, fcol = "svm", cex = ptsze)
addLegend(tan2009r1, fcol = "svm",
	  where = "bottomright",
	  ncol = 2, cex = .5)

## ----sessioninfo, echo=FALSE-----------------------------------------------
sessionInfo()

