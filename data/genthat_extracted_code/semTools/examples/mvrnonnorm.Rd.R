library(semTools)


### Name: mvrnonnorm
### Title: Generate Non-normal Data using Vale and Maurelli (1983) method
### Aliases: mvrnonnorm

### ** Examples


set.seed(123)
mvrnonnorm(20, c(1, 2), matrix(c(10, 2, 2, 5), 2, 2),
	skewness = c(5, 2), kurtosis = c(3, 3))
## again, with variable names specified in mu
set.seed(123)
mvrnonnorm(20, c(a = 1, b = 2), matrix(c(10, 2, 2, 5), 2, 2),
	skewness = c(5, 2), kurtosis = c(3, 3))




