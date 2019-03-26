library(MiDA)


### Name: MiStatCount
### Title: FDR for microarray gene expression data
### Aliases: MiStatCount

### ** Examples

data("IMexpression"); data("IMspecimen") # load data and specimen information
#sampling data and specimen information
ExpData<-MiDataSample(IMexpression, IMspecimen$diagnosis,"ebv", "norm")
Specimens<-MiSpecimenSample(IMspecimen$diagnosis, "ebv", "norm")
#Counting statistics
StatRes<-MiStatCount(ExpData, Specimens)
head(StatRes)




