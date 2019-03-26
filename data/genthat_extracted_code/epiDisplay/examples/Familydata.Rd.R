library(epiDisplay)


### Name: Familydata
### Title: Dataset of a hypothetical family
### Aliases: Familydata
### Keywords: datasets

### ** Examples

data(Familydata)
.data <- Familydata
des(.data)
summ(.data)
age2 <- with(.data, age)^2
with(.data, plot(age, money, log="y"))
dots.of.age <- seq(0,80,0.01)
new.data.frame <- data.frame(age=dots.of.age, age2=dots.of.age^2)
lm1 <- lm(log(money) ~ age + age2, data=.data)
summary(lm1)$coefficients
dots.of.money <- predict.lm(lm1, new.data.frame)
lines(dots.of.age, exp(dots.of.money), col="blue")



