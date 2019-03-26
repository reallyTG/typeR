library(uwIntroStats)


### Name: U
### Title: Create a Transformed Variable
### Aliases: U
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Reading in a dataset
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt", header=TRUE)
attach(mri)
# Create a spline based on absolute
U(ldl, type="lspline", knots=c(70, 100, 130, 160))
U(ldl, type="ls", knots=c(70,100,130,160))

# Create a spline based on change
U(ldl, type="ls", knots=c(70, 100, 130, 160), parameterization="change")

# Create a log transformed variable
U(age, type="log")

## Create a partial formula
U(ma=~male+age)




