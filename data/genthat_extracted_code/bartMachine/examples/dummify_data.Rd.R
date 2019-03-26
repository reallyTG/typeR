library(bartMachine)


### Name: dummify_data
### Title: Dummify Design Matrix
### Aliases: dummify_data
### Keywords: ~kwd1 ~kwd2

### ** Examples

#generate data
set.seed(11)
x1 = rnorm(20)
x2 = as.factor(ifelse(x1 > 0, "A", "B"))
x3 = runif(20)
X = data.frame(x1,x2,x3)
#dummify data
X_dummified = dummify_data(X)
print(X_dummified)



