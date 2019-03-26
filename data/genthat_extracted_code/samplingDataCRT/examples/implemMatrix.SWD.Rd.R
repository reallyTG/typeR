library(samplingDataCRT)


### Name: implemMatrix.SWD
### Title: Design matrix for SWD model under a grade of intervention
###   implementation pattern
### Aliases: implemMatrix.SWD

### ** Examples


implemMatrix.SWD(5,6,1, c(seq(0.4,1,0.2),1))

K<-6  #measurement (or timepoints)
I<-10 #Cluster
implemMatrix.SWD(nC=I, nT=K, nSw=2, pattern=c(seq(0.4,1,0.2),1))



