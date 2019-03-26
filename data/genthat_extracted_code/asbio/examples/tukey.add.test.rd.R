library(asbio)


### Name: tukey.add.test
### Title: Tukey's test of additivity.
### Aliases: tukey.add.test print.addtest
### Keywords: univar htest

### ** Examples

treatment<-as.factor(c(36,54,72,108,144,36,54,72,108,144,36,54,72,108,144))
block<-as.factor(c(rep(1,5),rep(2,5),rep(3,5)))
strength<-c(7.62,8.14,7.76,7.17,7.46,8,8.15,7.73,7.57,7.68, 7.93,7.87,7.74, 7.8,7.21)
tukey.add.test(strength,treatment,block)



