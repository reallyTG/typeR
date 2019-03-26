library(MSIseq)


### Name: MSIseq.classify
### Title: Classify Microsatellite Instability with MSIseq Classifier
### Aliases: MSIseq.classify

### ** Examples

## load sample data: test.mutationNum

data(test.mutationNum)
data(NGStestseqLen)


## classify on test data with NGSclassifier (the default classifier)

result <- MSIseq.classify(mutationNum = test.mutationNum)



