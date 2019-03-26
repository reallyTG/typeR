library(MiDA)


### Name: MiInflCount
### Title: Mean microarray probes' feature importance from binary
###   classification
### Aliases: MiInflCount

### ** Examples


# get gene expression and specimen data
data("IMexpression");data("IMspecimen")
# sample expression matrix and specimen data for binary classification,
# only "NORM" and "EBV" specimens are left
SampleMatrix<-MiDataSample(IMexpression, IMspecimen$diagnosis,"norm", "ebv")
SampleSpecimen<-MiSpecimenSample(IMspecimen$diagnosis, "norm", "ebv")
#Fitting, low tuning for faster running
ClassRes<-MiBiClassGBODT(SampleMatrix, SampleSpecimen, n.crossval = 3,
                        ntrees = 10, shrinkage = 1, intdepth = 2)
# List of influence data frames for all 3 models build using cross-validation
# is the 2nd element of BiClassGBODT results
Importances<-MiInflCount(ClassRes[[2]])
Importances[[1]][1:10,] # mean and sd. 0s are for low feature importance
Importances[[2]][1:10,] # original values for n.crossval = 3 models




