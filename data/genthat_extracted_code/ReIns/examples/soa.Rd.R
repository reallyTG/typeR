library(ReIns)


### Name: soa
### Title: SOA Group Medical Insurance Large Claims Database
### Aliases: soa
### Keywords: datasets

### ** Examples

data(soa)

# Histogram of log-claim amount
hist(log(soa$size),breaks=seq(10,16,0.2),xlab="log(Claim size)")

# Exponential QQ-plot of claim amount
ExpQQ(soa$size)

# Mean excess plot of claim amount (function of k)
MeanExcess(soa$size, k=TRUE)

# Mean excess plot of claim amount (function of order statistics)
MeanExcess(soa$size, k=FALSE)



