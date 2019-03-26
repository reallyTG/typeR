library(royston)


### Name: royston.test
### Title: Royston's Multivariate Normality Test
### Aliases: royston.test

### ** Examples

a=iris[1:50,1:4] # Iris data only for setosa and four variables
royston.test(a)  # Data analyzed have a non-normal distribution.

#Variable 4 (petal width) is markedly non-normal. So when take off that variable;

dev.new()
a=iris[1:50,1:3] # Iris data only for setosa and three variables
royston.test(a)  # Data analyzed have a normal distribution.



