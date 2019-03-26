library(greybox)


### Name: rmc
### Title: Regression for Multiple Comparison
### Aliases: rmc
### Keywords: htest

### ** Examples

N <- 50
M <- 4
ourData <- matrix(rnorm(N*M,mean=0,sd=1), N, M)
ourData[,2] <- ourData[,2]+4
ourData[,3] <- ourData[,3]+3
ourData[,4] <- ourData[,4]+2
colnames(ourData) <- c("Method A","Method B","Method C - long name","Method D")
rmc(ourData, distribution="dnorm", level=0.95)
# In case of AE-based measures, distribution="dfnorm" should be selected
rmc(abs(ourData), distribution="dfnorm", level=0.95)

# APE-based measures should not be used in general...

# If RelMAE or RelMSE is used for measuring data, then it makes sense to use
# distribution="dlnorm" for the RelMAE / RelMSE, as it can be approximated by
# log normal distribution, because according to Davydenko & Fildes (2013) the
# logarithms of these measures have symmetric distribution.
ourTest <- rmc((abs(ourData) / rfnorm(N, 0.3, 1)), distribution="dlnorm", level=0.95)
# The exponents of mean values from this function will correspond to the
# geometric means of RelMAE / RelMSE.
exp(ourTest$mean)
# The same is for the intervals:
exp(ourTest$interval)

# You can also reproduce plots in different styles:
plot(ourTest, style="lines")

# Or you can use the default "mcb" style and set additional parameters for the plot():
par(mar=c(2,2,4,0)+0.1)
plot(ourTest, main="Four methods")

# The following example should give similar results to Nemenyi test on
# large samples, which compares medians of the distributions:
rmc(t(apply(ourData,1,rank)), distribution="dnorm", level=0.95)

# You can also give a try to SE-based measures with distribution="dchisq":
rmc(ourData^2, distribution="dchisq", level=0.95)




