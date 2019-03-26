library(QDComparison)


### Name: Depression
### Title: Jackson's CESD Depression Scores
### Aliases: Depression
### Keywords: datasets

### ** Examples

data(Depression)
## maybe str(Depression)
y <- Depression[,2]
x <- Depression[,1]
hist(y[x==1])



