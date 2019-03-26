library(Comp2ROC)


### Name: Comp2ROC-package
### Title: Comparation of Two ROC Curves that Intersect
### Aliases: Comp2ROC-package Comp2ROC
### Keywords: package Comp2ROC compare ROC

### ** Examples

# This is a simple example on how to use the package with the given dataset ZHANG (paired samples):
nameE = "Zhang"
modality1DataColumn = "modality1"
modality2DataColumn = "modality2"
data(zhang)
results = roc.curves.boot(zhang, 10, 0.05, name=nameE,
                          mod1=modality1DataColumn, mod2=modality2DataColumn)
## No test: 
rocboot.summary(results, "modality1", "modality2")
## End(No test)
## No test: 
# This is another simple example on how to use the package with the given
# dataset CAS2015 (unpaired samples):
nameE = "CAS2015"
modality1DataColumn = "CRIBM"
modality2DataColumn = "CRIBF"
paired = FALSE
data(cas2015)
results = roc.curves.boot(cas2015, 1000, 0.05, name=nameE,
                          mod1=modality1DataColumn, mod2=modality2DataColumn, paired)
rocboot.summary(results, modality1DataColumn, modality2DataColumn)
## End(No test)



