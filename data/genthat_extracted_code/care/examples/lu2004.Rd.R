library(care)


### Name: lu2004
### Title: Brain Aging Study of Lu et al. (2004)
### Aliases: lu2004
### Keywords: datasets

### ** Examples

# load care library
library("care")

# load Lu et al. (2004) data set
data(lu2004)
dim(lu2004$x) # 30 403
hist(lu2004$x)
length(lu2004$y) # 30
lu2004$y # age



