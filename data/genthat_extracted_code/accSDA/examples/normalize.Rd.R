library(accSDA)


### Name: normalize
### Title: Normalize training data
### Aliases: normalize

### ** Examples

## Data
X<-matrix(sample(seq(3),12,replace=TRUE),nrow=3)

## Normalize data
Nm<-normalize(X)
print(Nm$Xc)

## See if any variables have been removed
which(!Nm$Id)



