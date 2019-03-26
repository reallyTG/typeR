library(SubLasso)


### Name: Colon
### Title: Gene expression data from Alon et al. (1999)
### Aliases: Colon
### Keywords: datasets

### ** Examples

# load plsgenomics library
library(SubLasso)

# load data set
data(Colon)

# how many samples and how many genes ?
dim(Colon$X)

# how many samples of class 1 and 2 respectively ?
sum(Colon$Y==1)
sum(Colon$Y==2)



