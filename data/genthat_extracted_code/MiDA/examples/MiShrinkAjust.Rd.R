library(MiDA)


### Name: MiShrinkAjust
### Title: Ajust learning rate parameter for fitting generalized boosted
###   regression modelsfor fitting generalized boosted regression models
### Aliases: MiShrinkAjust

### ** Examples

data("IMexpression");data("IMspecimen")
#sample expression matrix and specimen data for binary classification,
#only "NORM" and "EBV" specimens are left
SampleMatrix<-MiDataSample(IMexpression, IMspecimen$diagnosis,"norm", "ebv")
SampleSpecimen<-MiSpecimenSample(IMspecimen$diagnosis, "norm", "ebv")
#Fitting, low tuning for faster running. Test shrinkage
set.seed(1)
ClassRes<-MiShrinkAjust(SampleMatrix, SampleSpecimen, test.frac = 5, times = 3,
                        ntrees = 10, shrinkage = c(0.1, 1), intdepth = 2)
ClassRes[[1]] # train accuracy
ClassRes[[2]] # test accuracy




