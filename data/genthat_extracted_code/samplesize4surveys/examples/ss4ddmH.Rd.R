library(samplesize4surveys)


### Name: ss4ddmH
### Title: The required sample size for testing a null hyphotesis for a
###   double difference of proportions
### Aliases: ss4ddmH

### ** Examples

ss4ddmH(N = 100000, mu1=50, mu2=55, mu3=50, mu4=65, 
sigma1 = 10, sigma2 = 12, sigma3 = 10, sigma4 = 12, D=3)
ss4ddmH(N = 100000, mu1=50, mu2=55, mu3=50, mu4=65, 
sigma1 = 10, sigma2 = 12, sigma3 = 10, sigma4 = 12, D=1, plot=TRUE)
ss4ddmH(N = 100000, mu1=50, mu2=55, mu3=50, mu4=65, 
sigma1 = 10, sigma2 = 12, sigma3 = 10, sigma4 = 12, D=0.5, DEFF = 2, plot=TRUE)
ss4ddmH(N = 100000, mu1=50, mu2=55, mu3=50, mu4=65, 
sigma1 = 10, sigma2 = 12, sigma3 = 10, sigma4 = 12, D=0.5, DEFF = 2, conf = 0.99, 
       power = 0.9, plot=TRUE)

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

BigLucyT0.yes <- subset(BigLucyT0, ISO == 'yes')
BigLucyT0.no <- subset(BigLucyT0, ISO == 'no')
BigLucyT1.yes <- subset(BigLucyT1, ISO == 'yes')
BigLucyT1.no <- subset(BigLucyT1, ISO == 'no')
mu1 <- mean(BigLucyT0.yes$Income)
mu2 <- mean(BigLucyT0.no$Income)
mu3 <- mean(BigLucyT1.yes$Income)
mu4 <- mean(BigLucyT1.no$Income)
sigma1 <- sd(BigLucyT0.yes$Income)
sigma2 <- sd(BigLucyT0.no$Income)
sigma3 <- sd(BigLucyT1.yes$Income)
sigma4 <- sd(BigLucyT1.no$Income)

# The minimum sample size for testing 
# H_0: (mu_1 - mu_2) - (mu_3 - mu_4) = 0   vs.   
# H_a: (mu_1 - mu_2) - (mu_3 - mu_4) = D = 3

ss4ddmH(N, mu1, mu2, mu3, mu4, sigma1, sigma2, sigma3, sigma4,
 D = 3, conf = 0.99, power = 0.9, DEFF = 3.45, plot=TRUE)



