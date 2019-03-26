library(samplesize4surveys)


### Name: ss4ddm
### Title: The required sample size for estimating a double difference of
###   means
### Aliases: ss4ddm

### ** Examples

ss4ddm(N=100000, mu1=50, mu2=55, mu3=50, mu4=65, 
sigma1 = 10, sigma2 = 12, sigma3 = 10, sigma4 = 12, cve=0.05, rme=0.03)
ss4ddm(N=100000, mu1=50, mu2=55, mu3=50, mu4=65, 
sigma1 = 10, sigma2 = 12, sigma3 = 10, sigma4 = 12, cve=0.05, rme=0.03, plot=TRUE)
ss4ddm(N=100000, mu1=50, mu2=55, mu3=50, mu4=65, 
sigma1 = 10, sigma2 = 12, sigma3 = 10, sigma4 = 12, DEFF=3.45, conf=0.99, cve=0.03, 
     rme=0.03, plot=TRUE)

#############################
# Example with BigLucy data #
#############################
data(BigLucyT0T1)
attach(BigLucyT0T1)

BigLucyT0 <- BigLucyT0T1[Time == 0,]
BigLucyT1 <- BigLucyT0T1[Time == 1,]
N1 <- table(BigLucyT0$ISO)[1]
N2 <- table(BigLucyT0$ISO)[2]
N <- max(N1,N2)

BigLucyT0.yes <- subset(BigLucyT0, ISO == "yes")
BigLucyT0.no <- subset(BigLucyT0, ISO == "no")
BigLucyT1.yes <- subset(BigLucyT1, ISO == "yes")
BigLucyT1.no <- subset(BigLucyT1, ISO == "no")
mu1 <- mean(BigLucyT0.yes$Income)
mu2 <- mean(BigLucyT0.no$Income)
mu3 <- mean(BigLucyT1.yes$Income)
mu4 <- mean(BigLucyT1.no$Income)
sigma1 <- sd(BigLucyT0.yes$Income)
sigma2 <- sd(BigLucyT0.no$Income)
sigma3 <- sd(BigLucyT1.yes$Income)
sigma4 <- sd(BigLucyT1.no$Income)

# The minimum sample size for simple random sampling
ss4ddm(N, mu1, mu2, mu3, mu4, sigma1, sigma2, sigma3, sigma4, 
DEFF=1, conf=0.95, cve=0.001, rme=0.001, plot=TRUE)
# The minimum sample size for a complex sampling design
ss4ddm(N, mu1, mu2, mu3, mu4, sigma1, sigma2, sigma3, sigma4, 
DEFF=3.45, conf=0.99, cve=0.03, rme=0.03, plot=TRUE)



