library(BSDA)


### Name: Phone
### Title: Length of long-distance phone calls for a small business firm
### Aliases: Phone
### Keywords: datasets

### ** Examples


qqnorm(Phone$time)
qqline(Phone$time)
shapiro.test(Phone$time)
SIGN.test(Phone$time, md = 5, alternative = "greater")




