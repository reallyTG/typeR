library(MSIseq)


### Name: MSIseq.train
### Title: Build Microsatellite Instability Classification Model with
###   Training Dataset
### Aliases: MSIseq.train

### ** Examples

## load sample data (train.mutationNum, NGStraintype, 
## NGStrainclass)

data(train.mutationNum)
data(NGStrainclass)
data(NGStraintype)

## create NGSclassifier with traindata
## note that this is a built-in classifier, which can be directly used 
## if you do not have your own training data to create a classifier

NGSclassifier<-MSIseq.train(mutationNum = train.mutationNum, 
  classification=NGStrainclass, cancerType=NGStraintype)



