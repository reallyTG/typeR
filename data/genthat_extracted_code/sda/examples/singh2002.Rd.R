library(sda)


### Name: singh2002
### Title: Prostate Cancer Study of Singh et al. (2002)
### Aliases: singh2002
### Keywords: datasets

### ** Examples

# load sda library
library("sda")

# load Singh et al (2001) data set
data(singh2002)
dim(singh2002$x) # 102 6033
hist(singh2002$x)
singh2002$y # 2 levels



