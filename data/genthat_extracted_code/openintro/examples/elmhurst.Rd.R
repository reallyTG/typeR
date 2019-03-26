library(openintro)


### Name: elmhurst
### Title: Elmhurst College gift aid
### Aliases: elmhurst
### Keywords: datasets

### ** Examples

data(elmhurst)
plot(elmhurst$family_income, elmhurst$gift_aid)
m <- lm(gift_aid ~ family_income, data = elmhurst)
abline(m)
summary(m)



