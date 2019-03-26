library(samplesize4surveys)


### Name: ss4dp
### Title: The required sample size for estimating a single difference of
###   proportions
### Aliases: ss4dp

### ** Examples

ss4dp(N=100000, P1=0.5, P2=0.55, cve=0.05, me=0.03)
ss4dp(N=100000, P1=0.5, P2=0.55, cve=0.05, me=0.03, plot=TRUE)
ss4dp(N=100000, P1=0.5, P2=0.55, DEFF=3.45, conf=0.99, cve=0.03, me=0.03, plot=TRUE)
ss4dp(N=100000, P1=0.5, P2=0.55, DEFF=3.45, T=0.5, R=0.5, conf=0.99, cve=0.03, me=0.03, plot=TRUE)

#############################
# Example with BigLucy data #
#############################
data(BigLucy)
attach(BigLucy)

N1 <- table(SPAM)[1]
N2 <- table(SPAM)[2]
N <- max(N1,N2)
P1 <- prop.table(table(SPAM))[1]
P2 <- prop.table(table(SPAM))[2]
# The minimum sample size for simple random sampling
ss4dp(N, P1, P2, DEFF=1, conf=0.99, cve=0.03, me=0.03, plot=TRUE)
# The minimum sample size for a complex sampling design
ss4dp(N, P1, P2, DEFF=3.45, conf=0.99, cve=0.03, me=0.03, plot=TRUE)



