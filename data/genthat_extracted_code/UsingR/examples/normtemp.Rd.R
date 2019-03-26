library(UsingR)


### Name: normtemp
### Title: Body temperature and heart rate of 130 health individuals
### Aliases: normtemp
### Keywords: datasets

### ** Examples

data(normtemp)
hist(normtemp$temperature)
t.test(normtemp$temperature,mu=98.2)
summary(lm(temperature ~ factor(gender), normtemp))



