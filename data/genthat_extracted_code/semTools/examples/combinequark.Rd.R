library(semTools)


### Name: combinequark
### Title: Combine the results from the quark function
### Aliases: combinequark

### ** Examples


set.seed(123321)
dat <- HolzingerSwineford1939[,7:15]
misspat <- matrix(runif(nrow(dat) * 9) < 0.3, nrow(dat))
dat[misspat] <- NA
dat <- cbind(HolzingerSwineford1939[,1:3], dat)

quark.list <- quark(data = dat, id = c(1, 2))

final.data <- combinequark(quark = quark.list, percent = 80)




