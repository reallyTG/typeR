library(MiDA)


### Name: MiNTreesAjust
### Title: Ajust number of trees parameter for fitting generalized boosted
###   regression models
### Aliases: MiNTreesAjust

### ** Examples

#get gene expression and specimen data
data("IMexpression");data("IMspecimen")
#sample expression matrix and specimen data for binary classification,
#only "NORM" and "EBV" specimens are left
SampleMatrix<-MiDataSample(IMexpression, IMspecimen$diagnosis,"norm", "ebv")
SampleSpecimen<-MiSpecimenSample(IMspecimen$diagnosis, "norm", "ebv")
#Fitting, low tuning for faster running. Test ntrees
set.seed(1)
ClassRes<-MiNTreesAjust(SampleMatrix, SampleSpecimen, test.frac = 5, times = 3,
                       ntrees = c(10, 20), shrinkage = 1, intdepth = 2)
ClassRes[[1]] # train accuracy
ClassRes[[2]] # test accuracy





