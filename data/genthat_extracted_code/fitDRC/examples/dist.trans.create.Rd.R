library(fitDRC)


### Name: dist.trans.create
### Title: Transformed distributions.
### Aliases: dist.trans.create
### Keywords: transformed distributions

### ** Examples

## Example 01 ##
trans.tan <- trans.tan.create(c(33,99))
dist.student <- dist.student.create(c(0,1,1000))
dist  <- dist.trans.create(dist.student,trans.tan)
dist
#plot(dist)

## Example 02 ##
trans.arctan <- trans.arctan.create(c(0,10))
dist.uniform <- dist.uniform.create(c(0,10))
dist         <- dist.trans.create(dist.uniform,trans.arctan)
dist
#plot(dist)




