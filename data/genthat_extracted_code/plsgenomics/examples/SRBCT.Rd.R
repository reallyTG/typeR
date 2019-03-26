library(plsgenomics)


### Name: SRBCT
### Title: Gene expression data from Khan et al. (2001)
### Aliases: SRBCT
### Keywords: datasets

### ** Examples

# load plsgenomics library
library(plsgenomics)

# load data set
data(SRBCT)

# how many samples and how many genes ?
dim(SRBCT$X)

# how many samples of class 1, 2, 3 and 4, respectively ?
sum(SRBCT$Y==1)
sum(SRBCT$Y==2)
sum(SRBCT$Y==3)
sum(SRBCT$Y==4)


