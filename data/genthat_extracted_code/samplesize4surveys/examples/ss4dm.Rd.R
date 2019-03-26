library(samplesize4surveys)


### Name: ss4dm
### Title: The required sample size for estimating a single difference of
###   proportions
### Aliases: ss4dm

### ** Examples

ss4dm(N=100000, mu1=50, mu2=55, sigma1 = 10, sigma2 = 12, cve=0.05, rme=0.03)
ss4dm(N=100000, mu1=50, mu2=55, sigma1 = 10, sigma2 = 12, cve=0.05, rme=0.03, plot=TRUE)
ss4dm(N=100000, mu1=50, mu2=55, sigma1 = 10, sigma2 = 12, DEFF=3.45, conf=0.99, cve=0.03, 
     rme=0.03, plot=TRUE)

#############################
# Example with BigLucy data #
#############################
data(BigLucy)
attach(BigLucy)

N1 <- table(SPAM)[1]
N2 <- table(SPAM)[2]
N <- max(N1,N2)

BigLucy.yes <- subset(BigLucy, SPAM == 'yes')
BigLucy.no <- subset(BigLucy, SPAM == 'no')
mu1 <- mean(BigLucy.yes$Income)
mu2 <- mean(BigLucy.no$Income)
sigma1 <- sd(BigLucy.yes$Income)
sigma2 <- sd(BigLucy.no$Income)

# The minimum sample size for simple random sampling
ss4dm(N, mu1, mu2, sigma1, sigma2, DEFF=1, conf=0.99, cve=0.03, rme=0.03, plot=TRUE)
# The minimum sample size for a complex sampling design
ss4dm(N, mu1, mu2, sigma1, sigma2, DEFF=3.45, conf=0.99, cve=0.03, rme=0.03, plot=TRUE)



