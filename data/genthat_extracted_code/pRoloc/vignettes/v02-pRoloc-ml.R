## ----style, echo = FALSE, results = 'asis'---------------------------------
BiocStyle::markdown()

## ----env, include=FALSE, echo=FALSE, cache=FALSE---------------------------
library("knitr")
opts_chunk$set(stop_on_error = 1L)
suppressPackageStartupMessages(library("MSnbase"))
suppressWarnings(suppressPackageStartupMessages(library("pRoloc")))
suppressPackageStartupMessages(library("pRolocdata"))

## ----pRolocdata------------------------------------------------------------
library("pRolocdata")
data(tan2009r1)
tan2009r1

## ----svmParamOptim, cache = TRUE, warning = FALSE, message = FALSE---------
params <- svmOptimisation(tan2009r1, times = 10,
						  xval = 5, verbose = FALSE)
params

## ----svmRes, warning=FALSE, tidy=FALSE, eval=TRUE--------------------------
tan2009r1 <- svmClassification(tan2009r1, params)
tan2009r1

## ----weigths, eval=FALSE---------------------------------------------------
#  w <- table(fData(markerMSnSet(dunkley2006))$markers)
#  wpar <- svmOptimisation(dunkley2006, class.weights = w)
#  wres <- svmClassification(dunkley2006, wpar, class.weights = w)

## ----getmlfunction, echo=FALSE---------------------------------------------
## Add chi^2.
tab <- data.frame('parameter optimisation' =
					  grep("Optimisation",
						   ls("package:pRoloc"), value = TRUE),
				  'classification' =
					  grep("Classification",
						   ls("package:pRoloc"), value = TRUE))

tab$algorithm <- c("nearest neighbour",
				   "nearest neighbour transfer learning",
				   "support vector machine",
				   "naive bayes",
				   "neural networks",
				   "PerTurbo",
				   "partial least square",
				   "random forest",
				   "support vector machine")

tab$package <- c("class", "pRoloc", "kernlab", "e1071",
				 "nnet", "pRoloc", "caret",
				 "randomForest", "e1071")

colnames(tab)[1] <- c("parameter optimisation")

## ----comptab, echo=FALSE---------------------------------------------------
kable(tab)

## ----sessioninfo, echo=FALSE-----------------------------------------------
sessionInfo()

