library(MiDA)


### Name: MiFracData
### Title: Subset an expression matrix based on probe's feature importance
### Aliases: MiFracData

### ** Examples

# get gene expression and specimen data
data("IMexpression");data("IMspecimen")
#sample expression matrix and specimen data for binary classification,
#only "NORM" and "EBV" specimens are left
SampleMatrix<-MiDataSample(IMexpression, IMspecimen$diagnosis,"norm", "ebv")
dim(SampleMatrix) # 100 probes
SampleSpecimen<-MiSpecimenSample(IMspecimen$diagnosis, "norm", "ebv")
#Fitting, low tuning for faster running
ClassRes<-MiBiClassGBODT(SampleMatrix, SampleSpecimen, n.crossval = 3,
                         ntrees = 10, shrinkage = 1, intdepth = 2)
# List of influence data frames for all 3 models build using cross-validation
# is the 2nd element of BiClassGBODT results
# take 10 most important probes from each model
Sample2Matrix<-MiFracData(SampleMatrix, importance.list = ClassRes[[2]], 10)
dim(Sample2Matrix) # less than 100 probes left




