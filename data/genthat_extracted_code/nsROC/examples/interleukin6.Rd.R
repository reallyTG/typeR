library(nsROC)


### Name: interleukin6
### Title: Interleukin 6 (IL6) data
### Aliases: interleukin6
### Keywords: datasets

### ** Examples

# Load the dataset
data(interleukin6)

# Plot pairs (FPR, TPR) for each Author

attach(interleukin6)

TPR <- TP/(TP+FN)
FPR <- FP/(FP+TN)
plot(FPR, TPR, xlim=c(0,1), ylim=c(0,1), lwd=10, pch=1, col='gray', xlab="False-Positive Rate",
    ylab="True-Positive Rate", main=paste("ROC curve interpolation"))

S <- unique(Author)
ind <- order(Author, FPR, TPR)
ord.data <- cbind(Author[ind], FPR[ind], TPR[ind])
roc.j <- sapply(S, function(j){
  lines(c(0,ord.data[Author==j,2],1), c(0,ord.data[Author==j,3],1), col='gray')})
for(i in 1:19){text(ord.data[i,2],ord.data[i,3],ord.data[i,1],cex=0.5)}



