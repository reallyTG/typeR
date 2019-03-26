library(samplingDataCRT)


### Name: completeDataDesignMatrix
### Title: Design matrix for complete data within design
### Aliases: completeDataDesignMatrix

### ** Examples

K<-6  #measurement (or timepoints)
I<-10 #Cluster
J<-2 #number of subjects
X<-designMatrix(nC=I, nT=K, nSw=2)
completeDataDesignMatrix(J, X)



