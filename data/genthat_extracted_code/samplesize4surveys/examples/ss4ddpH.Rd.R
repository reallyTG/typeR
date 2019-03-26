library(samplesize4surveys)


### Name: ss4ddpH
### Title: The required sample size for testing a null hyphotesis for a
###   double difference of proportions
### Aliases: ss4ddpH

### ** Examples

ss4ddpH(N = 100000, P1 = 0.5, P2 = 0.5, P3 = 0.5, P4 = 0.5, D=0.03)
ss4ddpH(N = 100000, P1 = 0.5, P2 = 0.5, P3 = 0.5, P4 = 0.5, D=0.03, plot=TRUE)
ss4ddpH(N = 100000, P1 = 0.5, P2 = 0.5, P3 = 0.5, P4 = 0.5, D=0.03, DEFF = 2, plot=TRUE)
ss4ddpH(N = 100000, P1 = 0.5, P2 = 0.5, P3 = 0.5, P4 = 0.5, 
D=0.03, conf = 0.99, power = 0.9, DEFF = 2, plot=TRUE)

#################################
# Example with BigLucyT0T1 data #
#################################
data(BigLucyT0T1)
attach(BigLucyT0T1)

BigLucyT0 <- BigLucyT0T1[Time == 0,]
BigLucyT1 <- BigLucyT0T1[Time == 1,]
N1 <- table(BigLucyT0$SPAM)[1]
N2 <- table(BigLucyT1$SPAM)[1]
N <- max(N1,N2)
P1 <- prop.table(table(BigLucyT0$ISO))[1]
P2 <- prop.table(table(BigLucyT1$ISO))[1]
P3 <- prop.table(table(BigLucyT0$ISO))[2]
P4 <- prop.table(table(BigLucyT1$ISO))[2]
# The minimum sample size for simple random sampling
ss4ddpH(N, P1, P2, P3, P4, D = 0.05, plot=TRUE)
# The minimum sample size for a complex sampling design
ss4ddpH(N, P1, P2, P3, P4, D = 0.05, DEFF = 2, T = 0.5, R = 0.5, conf=0.95, plot=TRUE)



