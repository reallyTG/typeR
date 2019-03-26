library(openintro)


### Name: student.housing
### Title: Community college housing (simulated data, 2015)
### Aliases: student.housing
### Keywords: datasets

### ** Examples

data(student.housing)
set.seed(5)
generate.student.housing <- data.frame(
    price = round(rnorm(175, 515, 65) + exp(rnorm(175, 4.2, 1))))
hist(student.housing$price, 20)
t.test(student.housing$price)
mean(student.housing$price)
sd(student.housing$price)
identical(student.housing, generate.student.housing)




