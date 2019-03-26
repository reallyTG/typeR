library(AER)


### Name: DJIA8012
### Title: Dow Jones Industrial Average (DJIA) index
### Aliases: DJIA8012
### Keywords: datasets

### ** Examples

data("DJIA8012")
plot(DJIA8012)

# p.26, Figure 2.18
dldjia <- diff(log(DJIA8012))
plot(dldjia)

# p.141, Figure 6.4
plot(window(dldjia, start = "1987-09-01", end = "1987-12-31"))

# p.167, Figure 7.1
dldjia9005 <- window(dldjia, start = "1990-01-01", end = "2005-12-31")
qqnorm(dldjia9005)
qqline(dldjia9005, lty = 2)

# p.170, Figure 7.4
acf(dldjia9005,  na.action = na.exclude, lag.max = 250, ylim =  c(-0.1, 0.25))
acf(dldjia9005^2,  na.action = na.exclude, lag.max = 250, ylim =  c(-0.1, 0.25))
acf(abs(dldjia9005),  na.action = na.exclude, lag.max = 250, ylim =  c(-0.1, 0.25))



