library(marg)


### Name: print.summary.marg
### Title: Use print() on a "summary.marg" object
### Aliases: print.summary.marg
### Keywords: methods print

### ** Examples

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
houses.cond <- cond(houses.rsm, front)
print(summary(houses.cond), digits = 4)
print(summary(houses.cond), Coef = FALSE)



