library(sidier)


### Name: distance.comb
### Title: Distance matrices combination
### Aliases: distance.comb

### ** Examples

mat1<-matrix(rep(1,16),ncol=4)
mat2<-matrix(rep(2,16),ncol=4)
mat3<-matrix(rep(3,16),ncol=4)
mat4<-matrix(rep(6,16),ncol=4)
mat5<-matrix(c(rep(1,4),rep(3,4),rep(1,4),rep(1,4)),ncol=4)
mat6<-matrix(c(rep(1,4),rep(4,4),rep(4,4),rep(4,4)),ncol=4)
mat7<-mat6
colnames(mat5)<-c("a","b","c","d")
colnames(mat6)<-c("b","a","c","d")
row.names(mat5)<-c("a","b","c","d")
row.names(mat6)<-c("b","a","c","d")

# Matrices with information about the same elements (a-d) but in different order, are automatically
# sorted before combination....

distance.comb(matrices=c("mat5","mat6"),saveFile=FALSE,method="Uncorrected")

# ... but this is not possible if any of the matrices lack row names:

distance.comb(matrices=c("mat5","mat7"),saveFile=FALSE,method="Uncorrected")

# More examples:
distance.comb(matrices=c("mat1","mat2","mat3","mat4"),alphas=rep(0.25,4),
saveFile=FALSE,method="Uncorrected")

distance.comb(matrices=c("mat1","mat2","mat3","mat4"),alphas=rep(0.25,4),
saveFile=FALSE,method="Corrected")

distance.comb(matrices=c("mat1","mat2","mat3","mat4"),alphas=c(0.66,0.33,0,0),
saveFile=FALSE,method="Uncorrected")

distance.comb(matrices=c("mat1","mat2","mat3","mat6"),alphas=c(0.66,0.33,0,0),
saveFile=FALSE,method="Uncorrected")



