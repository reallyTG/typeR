library(BSDA)


### Name: Alcohol
### Title: Ages at which 14 female alcoholics began drinking
### Aliases: Alcohol
### Keywords: datasets

### ** Examples


qqnorm(Alcohol$age)
qqline(Alcohol$age)
SIGN.test(Alcohol$age, md = 20, conf.level = 0.99)




