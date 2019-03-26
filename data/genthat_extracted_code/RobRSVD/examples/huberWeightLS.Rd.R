library(RobRSVD)


### Name: huberWeightLS
### Title: Huber's function
### Aliases: huberWeightLS
### Keywords: linear operator

### ** Examples

#generate a t distrbution matrix
x<-matrix(rt(100, 1), nrow=10)

#generate the huber weight matrix with k=1.345
y=huberWeightLS(x, k=1.345)



