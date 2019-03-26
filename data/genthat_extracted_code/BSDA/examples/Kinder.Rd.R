library(BSDA)


### Name: Kinder
### Title: Reading scores for first grade children who attended
###   kindergarten versus those who did not
### Aliases: Kinder
### Keywords: datasets

### ** Examples


boxplot(Kinder$kinder, Kinder$nokinder)
diff <- Kinder$kinder - Kinder$nokinder
qqnorm(diff)
qqline(diff)
shapiro.test(diff)
t.test(Kinder$kinder, Kinder$nokinder, paired = TRUE)
# Or
t.test(diff)
rm(diff)




