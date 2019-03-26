library(JADE)


### Name: plot.bss
### Title: Plotting an Object of Class bss
### Aliases: plot.bss
### Keywords: methods

### ** Examples

A<- matrix(rnorm(9),3,3)
s1 <- arima.sim(list(ar=c(0.3,0.6)),1000)
s2 <- arima.sim(list(ma=c(-0.3,0.3)),1000)
s3 <- arima.sim(list(ar=c(-0.8,0.1)),1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

res1 <- AMUSE(X)
plot(res1)
# not so useful:
plot(res1, plot.type = "single", col=1:3)

# not meaningful for this data
res2 <- JADE(X)
plot(res2)



