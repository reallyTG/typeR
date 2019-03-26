library(pRolocdata)


### Name: andy2011
### Title: LOPIT experiment on Human Embryonic Kidney fibroblast HEK293T
###   cells from Breckels et al. (2013)
### Aliases: andy2011 andy2011goCC andy2011hpa HEK293T2011 HEK293T2011hpa
###   HEK293T2011goCC
### Keywords: datasets

### ** Examples

data(HEK293T2011)
HEK293T2011
pData(HEK293T2011)
head(exprs(HEK293T2011))
## Organelle marker proteins
table(fData(HEK293T2011)$markers)
## PhenoDisco assignment results
table(fData(HEK293T2011)$pd.2013)

data(HEK293T2011goCC)
dim(HEK293T2011goCC)
head(featureNames(HEK293T2011goCC))
exprs(HEK293T2011goCC)[1:10, 1:5]



