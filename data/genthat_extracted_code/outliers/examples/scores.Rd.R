library(outliers)


### Name: scores
### Title: Calculate scores of the sample
### Aliases: scores
### Keywords: models

### ** Examples

set.seed(1234)
x = rnorm(10)
scores(x)
scores(x,prob=1)
scores(x,prob=0.5)
scores(x,prob=0.1)
scores(x,prob=0.93)
scores(x,type="iqr")
scores(x,type="mad")
scores(x,prob=0)



