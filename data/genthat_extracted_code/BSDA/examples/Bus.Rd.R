library(BSDA)


### Name: Bus
### Title: Attendance of bus drivers versus shift
### Aliases: Bus
### Keywords: datasets

### ** Examples


T1 <- xtabs(~attendance + shift, data = Bus)
T1
chisq.test(T1)




