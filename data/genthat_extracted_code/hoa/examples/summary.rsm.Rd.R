library(hoa)


### Name: summary.rsm
### Title: Summary Method for Regression-Scale Models
### Aliases: summary.rsm
### Keywords: models regression methods

### ** Examples

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
summary(houses.rsm)



