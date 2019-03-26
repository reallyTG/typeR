library(sitar)


### Name: BICadj
### Title: Ways to compare SITAR models for fit
### Aliases: BICadj AICadj varexp getL AICadj varexp getL
### Keywords: regression

### ** Examples

data(heights)
## fit sitar model for height
m1 <- sitar(x=age, y=height, id=id, data=heights, df=5)

## update it for log(height)
m2 <- update(m1, y=sqrt(height))

## compare variance explained in the two models
varexp(m1, m2)

## compare BIC adjusting for sqrt transform
## the pattern matches names starting with "m" followed by a digit
BICadj(pattern="^m[0-9]")

## find what power height is raised to
getL(quote(sqrt(sqrt(height))))



