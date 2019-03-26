library(spc4sts)


### Name: sms
### Title: Spatial Moving Statistic
### Aliases: sms

### ** Examples

img <- matrix(rnorm(100),10,10)
ms.ad <- sms(img, "ad", 3, exptailecdf(rnorm(1000)))
ms.bp <- sms(img, "bp", 3)



