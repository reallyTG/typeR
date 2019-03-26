library(SQDA)


### Name: sQDA
### Title: Spase Quadratic Discriminant Analysis
### Aliases: sQDA

### ** Examples

data(exampledata)
res<-sQDA(train.data[1:100,],test.data[1:100,],lams=0.2,presel=FALSE)
sum(res$pred!=colnames(test.data))/ncol(test.data)  ##prediction error
res$p ## number of blocks selected
res$pred ## predicted class labels on test.data



