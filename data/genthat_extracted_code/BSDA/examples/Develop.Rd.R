library(BSDA)


### Name: Develop
### Title: Demographic characteristics of developmental students at 2-year
###   colleges and 4-year colleges
### Aliases: Develop
### Keywords: datasets

### ** Examples


T1 <- xtabs(~race + college, data = Develop)
T1
chisq.test(T1)
rm(T1)




