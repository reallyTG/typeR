library(alr3)


### Name: pureErrorAnova
### Title: Pure Error analysis of variance
### Aliases: pureErrorAnova pureErrorAnova.lm
### Keywords: models regression

### ** Examples

x <- c(1,1,1,2,3,3,4,4,4,4)
y <- c(2.55,2.75,2.57,2.40,4.19,4.70,3.81,4.87,2.93,4.52)
m1 <- lm(y~x)
anova(m1)  # ignore pure error
pureErrorAnova(m1)  # include pure error

head(forbes)
m2 <- lm(Lpres~Temp, data=forbes)
pureErrorAnova(m2)  # function does nothing because there is no pure error




