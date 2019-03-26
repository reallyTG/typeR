library(prozor)


### Name: computeFDRwithID
### Title: Compute FDR given a score
### Aliases: computeFDRwithID

### ** Examples

library(prozor)
data(fdrSample)
# call constructor

fdr1<-computeFDRwithID(fdrSample$score, fdrSample$proteinID, larger_better = FALSE)
names(fdr1)
plot(fdr1$score, fdr1$FPR,type="l",xlim=c(0,0.001), ylim=c(0,0.0002))
lines(fdr1$score, fdr1$qValue_FPR, col=2)
lines(fdr1$score, fdr1$SimpleFDR,type="l",col=4)
lines(fdr1$score, fdr1$qValue_SimpleFDR, col=5)


fdr1<-computeFDRwithID(fdrSample$score2, fdrSample$proteinID, larger_better = TRUE)
names(fdr1)
plot(fdr1$score, fdr1$FPR,type="l", xlim=c(2.5,5),ylim=c(0,0.001))
lines(fdr1$score, fdr1$qValue_FPR, col=2)
lines(fdr1$score, fdr1$SimpleFDR,type="l",col=4)
lines(fdr1$score, fdr1$qValue_SimpleFDR, col=5)




