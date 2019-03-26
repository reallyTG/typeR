library(MSnbase)


### Name: expandFeatureVars
### Title: Expand or merge feature variables
### Aliases: expandFeatureVars mergeFeatureVars

### ** Examples

library("pRolocdata")
data(hyperLOPIT2015)
fvarLabels(hyperLOPIT2015)
## Let's merge all svm prediction feature variables
(k <- grep("^svm", fvarLabels(hyperLOPIT2015), value = TRUE))
hl <- mergeFeatureVars(hyperLOPIT2015, fcol = k, fcol2 = "SVM")
fvarLabels(hl)
head(fData(hl)$SVM)

## Let's expand the new SVM into individual columns
hl2 <- expandFeatureVars(hl, "SVM")
fvarLabels(hl2)
## We can set the prefix manually
hl2 <- expandFeatureVars(hl, "SVM", prefix = "Expanded")
fvarLabels(hl2)
## If we don't want any prefix
hl2 <- expandFeatureVars(hl, "SVM", prefix = NULL)
fvarLabels(hl2)



