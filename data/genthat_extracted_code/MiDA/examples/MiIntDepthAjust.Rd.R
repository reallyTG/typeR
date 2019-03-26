library(MiDA)


### Name: MiIntDepthAjust
### Title: Ajust maximum depth parameter for fitting generalized boosted
###   regression models
### Aliases: MiIntDepthAjust

### ** Examples

#get gene expression and specimen data
data("IMexpression");data("IMspecimen")
#sample expression matrix and specimen data for binary classification,
#only "NORM" and "EBV" specimens are left
SampleMatrix<-MiDataSample(IMexpression, IMspecimen$diagnosis,"norm", "ebv")
SampleSpecimen<-MiSpecimenSample(IMspecimen$diagnosis, "norm", "ebv")
#Fitting, low tuning for faster running. Test intdepth
set.seed(1)
ClassRes<-MiIntDepthAjust(SampleMatrix, SampleSpecimen, test.frac = 5, times=3,
                          ntrees = 10, shrinkage = 1, intdepth =  c(1,2))
ClassRes[[1]] # train accuracy
ClassRes[[2]] # test accuracy




