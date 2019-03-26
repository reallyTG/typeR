library(MiDA)


### Name: MiBiClassGBODT
### Title: Binary classification using gradient boosting over desicion
###   trees
### Aliases: MiBiClassGBODT

### ** Examples


#get gene expression and specimen data
data("IMexpression");data("IMspecimen")
#sample expression matrix and specimen data for binary classification,
#only "NORM" and "EBV" specimens are left
SampleMatrix<-MiDataSample(IMexpression, IMspecimen$diagnosis,"norm", "ebv")
SampleSpecimen<-MiSpecimenSample(IMspecimen$diagnosis, "norm", "ebv")
#Fitting, low tuning for faster running
BoostRes<-MiBiClassGBODT(SampleMatrix, SampleSpecimen, n.crossval = 3,
                       ntrees = 10, shrinkage = 1, intdepth = 2)
BoostRes[[1]] # QC values for n.crossval = 3 models and its summary
length(BoostRes[[2]]) # n.crossval = 3 data frames of probes feature importance for classification
head(BoostRes[[2]][[1]])




