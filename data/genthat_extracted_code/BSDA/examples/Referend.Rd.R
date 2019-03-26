library(BSDA)


### Name: Referend
### Title: Opinion on referendum by view on freedom of the press
### Aliases: Referend
### Keywords: datasets

### ** Examples


T1 <- xtabs(~choice + response, data = Referend)
T1
chisq.test(T1)
chisq.test(T1)$expected




