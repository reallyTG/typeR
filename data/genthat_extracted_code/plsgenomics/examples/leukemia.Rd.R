library(plsgenomics)


### Name: leukemia
### Title: Gene expression data from Golub et al. (1999)
### Aliases: leukemia
### Keywords: datasets

### ** Examples

# load plsgenomics library
library(plsgenomics)

# load data set
data(leukemia)

# how many samples and how many genes ?
dim(leukemia$X)

# how many samples of class 1 and 2, respectively ?
sum(leukemia$Y==1)
sum(leukemia$Y==2)


