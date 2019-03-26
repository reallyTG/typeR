library(kernlab)


### Name: musk
### Title: Musk data set
### Aliases: musk
### Keywords: datasets

### ** Examples

data(musk)

muskm <- ksvm(Class~.,data=musk,kernel="rbfdot",C=1000)

muskm




