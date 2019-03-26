library(dna)


### Name: resultsModTest-class
### Title: Class '"resultsModTest"'
### Aliases: resultsModTest-class get.results,resultsModTest-method
###   summary,resultsModTest-method show,resultsModTest-method
### Keywords: classes tests

### ** Examples

# small example illustrating test procedures
X1=rbind(
c(2.5,6.7,4.5,2.3,8.4,3.1),
c(1.2,0.7,4.0,9.1,6.6,7.1),
c(4.3,-1.2,7.5,3.8,1.0,9.3),
c(9.5,7.6,5.4,2.3,1.1,0.2))
colnames(X1)=paste("G",1:6,sep="")

X2=rbind(
c(4.5,2.4,6.8,5.6,4.5,1.2,4.5),
c(7.6,9.0,0.1,3.4,5.6,5.5,1.2),
c(8.3,4.5,7.0,1.2,4.3,3.7,6.8),
c(3.4,1.1,6.9,7.2,3.1,0.9,6.6),
c(3.4,2.2,1.3,5.5,9.8,6.7,0.6))
colnames(X2)=paste("G",8:2,sep="")

# perform a test for modular structure using a minimum module size of 2
# and threshold of .5 with PLS connectivity scores
## Not run: test.modular.structure(X1,X2,min.module.size=2)
## Not run: summary(tms)

# extract results for a test of modular structure
## Not run: results.tms=get.results(tms)
## Not run: results.tms



