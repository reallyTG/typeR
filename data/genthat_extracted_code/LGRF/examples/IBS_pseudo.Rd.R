library(LGRF)


### Name: IBS_pseudo
### Title: Generate IBS pseudo variables
### Aliases: IBS_pseudo
### Keywords: IBS

### ** Examples


library(LGRF)

# Load data example
# Z: genotype matrix, n by q matrix

data(LGRF.example)
Z<-LGRF.example$Z
A<-IBS_pseudo(Z)

# Then the IBS matrix can be calculated by K.IBS<-AA^T.




