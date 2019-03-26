library(kml)


### Name: kml-package
### Title: ~ Overview: K-means for Longitudinal data ~
### Aliases: kml-package
### Keywords: package dplot iplot chron spatial classif cluster
###   nonparametric ts robust models

### ** Examples

## No test: 
### 1. Data Preparation
data(epipageShort)
names(epipageShort)
cldSDQ <- cld(epipageShort,timeInData=3:6,time=c(3,4,5,8))

### 2. Building "optimal" clusteration (with only 3 redrawings)
kml(cldSDQ,nbRedrawing=3,toPlot="both")

### 3. Exporting results
### To check the best's cluster numbers
plotAllCriterion(cldSDQ)


# To see the best partition
try(choice(cldSDQ))

### 4. Further analysis
epipageShort$clust <- getClusters(cldSDQ,4)
summary(glm(gender~clust,data=epipageShort,family="binomial"))
## End(No test)



