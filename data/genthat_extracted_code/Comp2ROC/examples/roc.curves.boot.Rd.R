library(Comp2ROC)


### Name: roc.curves.boot
### Title: Compare curves
### Aliases: roc.curves.boot
### Keywords: Permutation Comparation ROC Curves

### ** Examples

## No test: 
data(zhang)
nameE = "new_Zhang"
modality1DataColumn = "modality1"
modality2DataColumn = "modality2"
data = read.manually.introduced(zhang, moda1, TRUE, moda2, TRUE, "status", TRUE)
results = roc.curves.boot(zhang, 1000, 0.05, name=nameE,
                          mod1=modality1DataColumn, mod2=modality2DataColumn)
## End(No test)



