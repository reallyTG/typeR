library(RPCLR)


### Name: GetVarImp
### Title: To obtain variable importance scores using the R-PCLR algorithm.
### Aliases: GetVarImp

### ** Examples

## Simulate Data of 100 matched pairs, 3 biomarkers, 5 noise features 
set.seed(1234)
MyDat <- GenerateData(50, 3, 5, 0.5, 0.4)
Dat <- MyDat$Data
Out <- MyDat$Out
Strat <- MyDat$Strat

## Get Variable Importance
MyResults <- GetVarImp(Dat, Out, Strat, mtry=3, numBS=25)

## Print results
hist(MyResults, breaks=6, col="orange", xlab="Importance score", ylab="Number of features", main="Histogram of R-PCLR variable importance scores")
output <- cbind(as.character(colnames(Dat)), format(MyResults, digits=3))
print(output)

## Sort from most important (highest importance score) to least important feature (lowest importance score)
ind <- sort(MyResults, index.return=TRUE, decreasing=TRUE)$ix
output[ind,]





