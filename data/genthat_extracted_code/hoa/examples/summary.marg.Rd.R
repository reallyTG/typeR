library(hoa)


### Name: summary.marg
### Title: Summary Method for Objects of Class "marg"
### Aliases: summary.marg
### Keywords: regression methods

### ** Examples

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
houses.marg <- cond(houses.rsm, floor)
summary(houses.marg, test = 0, coef = FALSE)



