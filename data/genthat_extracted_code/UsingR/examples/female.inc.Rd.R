library(UsingR)


### Name: female.inc
### Title: Income distribution for females in 2001
### Aliases: female.inc
### Keywords: datasets

### ** Examples

data(female.inc)
boxplot(income ~ race, female.inc)
boxplot(log(income,10) ~ race, female.inc)
sapply(with(female.inc,split(income,race)),median)



