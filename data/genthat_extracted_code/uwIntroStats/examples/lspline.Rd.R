library(uwIntroStats)


### Name: lspline
### Title: Create Linear Splines
### Aliases: lspline lsplineD
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Reading in a dataset
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt", header=TRUE)
attach(mri)
# Create a spline based on absolute
lspline(ldl, c(70, 100, 130, 160))

# Create a spline based on change
lsplineD(ldl, c(70, 100, 130, 160))



