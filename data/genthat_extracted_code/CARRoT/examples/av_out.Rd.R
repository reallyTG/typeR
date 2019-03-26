library(CARRoT)


### Name: av_out
### Title: Averaging out the predictive power
### Aliases: av_out

### ** Examples

#creating a matrix of predictive powers

preds<-cbind(matrix(runif(40,1,4),ncol=10),matrix(runif(40,1.5,4),ncol=10))
preds<-cbind(preds,matrix(runif(40,1,3.5),ncol=10))

#running the function

av_out(preds,3,5)



