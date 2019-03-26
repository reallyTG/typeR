library(KScorrect)


### Name: dlunif
### Title: The Log Uniform Distribution
### Aliases: dlunif plunif qlunif rlunif

### ** Examples

plot(1:100, dlunif(1:100, exp(1), exp(10)), type="l", main="Loguniform density")
plot(log(1:100), dlunif(log(1:100), log(1), log(10)), type="l",
     main="Loguniform density")

plot(1:100, plunif(1:100, exp(1), exp(10)), type="l", main="Loguniform cumulative")
plot(qlunif(ppoints(100), exp(1), exp(10)), type="l", main="Loguniform quantile")

hist(rlunif(1000, exp(1), exp(10)), main="random loguniform sample")
hist(log(rlunif(10000, exp(1), exp(10))), main="random loguniform sample")
hist(log(rlunif(10000, exp(1), exp(10), base=10), base=10), main="random loguniform sample")




