library(prozor)


### Name: predictScoreFDR
### Title: Predict score given FDR
### Aliases: predictScoreFDR

### ** Examples

data(fdrSample)
fdr1<-computeFDRwithID(fdrSample$score, fdrSample$proteinID, larger_better = FALSE)

predictScoreFDR(fdr1,qValue=5)
fdr2<-computeFDRwithID(fdrSample$score2, fdrSample$proteinID, larger_better = TRUE)
predictScoreFDR(fdr2,qValue=5)




