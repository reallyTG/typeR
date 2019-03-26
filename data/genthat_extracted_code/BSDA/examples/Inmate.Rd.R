library(BSDA)


### Name: Inmate
### Title: Type of drug offense by race
### Aliases: Inmate
### Keywords: datasets

### ** Examples


T1 <- xtabs(~race + drug, data = Inmate)
T1
chisq.test(T1)
rm(T1)




