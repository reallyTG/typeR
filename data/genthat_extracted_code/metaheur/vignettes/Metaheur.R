## ------------------------------------------------------------------------
set.seed(1)
testdata <- iris
testdata[sample(1:150,40),3] <- NA # add missing values to the third variable
testdata[,4] <- rnorm(150, testdata[,4], 2) # add noise to the fourth variable
testdata$Irrelevant <- runif(150, 0, 1) # add an irrelevant feature

## ---- eval=FALSE---------------------------------------------------------
#  library(preprocomb)
#  examplegrid <- preprocomb::setgrid(phases=c("imputation", "smoothing", "scaling", "outliers", "selection"), data=testdata)

## ------------------------------------------------------------------------
library(metaheur)

## ---- eval=FALSE---------------------------------------------------------
#  examplesearch <- metaheur(examplegrid, model="svmRadial", iterations = 54, nholdout = 20)

## ------------------------------------------------------------------------
getwalltime(examplesearch)

## ---- fig.width=8--------------------------------------------------------
getbestheur(examplesearch)

## ------------------------------------------------------------------------
getlogs(examplesearch, 15)

## ---- eval=FALSE---------------------------------------------------------
#  examplehyperparam <- metaheurhyper(examplegrid, cores=2, trials=10, iterations=54, nholdout=10)

## ---- fig.width=8--------------------------------------------------------
plotsearchpath(examplehyperparam)

