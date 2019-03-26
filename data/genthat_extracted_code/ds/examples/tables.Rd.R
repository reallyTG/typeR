library(ds)


### Name: tables
### Title: Tables of Categorical Variables
### Aliases: tables

### ** Examples

treatments=gl(2, 30, labels = c("Control", "Treat"))
resultsA=rep(c("positive","negative", "positive","negative"),c(25,5,7,23))
resultsB=rep(c("positive","negative", "positive","negative"),c(28,2,8,22))
resultsC=rep(c("positive","negative", "positive","negative"),c(16,14,13,17))

data=data.frame(treatments,resultsA, resultsB, resultsC)

r=tables(data)

names(r)

r

r[1]
r[2]
r[6]




