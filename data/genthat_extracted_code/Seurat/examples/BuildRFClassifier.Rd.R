library(Seurat)


### Name: BuildRFClassifier
### Title: Build Random Forest Classifier
### Aliases: BuildRFClassifier

### ** Examples

pbmc_small
# Builds the random forest classifier to be used with ClassifyCells
# Useful if you want to use the same classifier with several sets of new data
classifier <- BuildRFClassifier(pbmc_small, training.classes = pbmc_small@ident)




