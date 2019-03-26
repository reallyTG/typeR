library(MiRSEA)


### Name: S2N
### Title: calculate signal to noise ratio for microRNAs(miRNAs)
### Aliases: S2N
### Keywords: file

### ** Examples

##Matrix of miRNAs expression values
A<-matrix(runif(200),10,20)
##class.labels("0" or "1")
a1<-rep(0,20)
a1[sample(1:20,5)]=1
a1<-sort(a1,decreasing=FALSE)
#calculate signal to noise ratio for example data
M1<-S2N(A, class.labels=a1, miR.labels=seq(1,10), nperm=100)
#show actual results for top five in the matrix 
M1$obs.s2n.matrix[1:5,1]
#show permutation results
M1$s2n.matrix[1:5,1:5]



