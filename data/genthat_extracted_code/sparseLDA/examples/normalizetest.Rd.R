library(sparseLDA)


### Name: normalizetest
### Title: Normalize test data
### Aliases: normalizetest
### Keywords: multivariate

### ** Examples

## Data
Xtr<-matrix(sample(seq(3),12,replace=TRUE),nrow=3)
Xtst<-matrix(sample(seq(3),12,replace=TRUE),nrow=3)

## Normalize training data 
Nm<-normalize(Xtr)

## Normalize test data
Xtst<-normalizetest(Xtst,Nm)



