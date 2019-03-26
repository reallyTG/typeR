library(samplesize4surveys)


### Name: ss4p
### Title: The required sample size for estimating a single proportion
### Aliases: ss4p

### ** Examples

ss4p(N=10000, P=0.5, cve=0.05, me=0.03)
ss4p(N=10000, P=0.5, cve=0.05, me=0.03, plot=TRUE)
ss4p(N=10000, P=0.01, DEFF=3.45, conf=0.99, cve=0.03, me=0.03, plot=TRUE)

##########################
# Example with Lucy data #
##########################

data(Lucy)
attach(Lucy)
N <- nrow(Lucy)
P <- prop.table(table(SPAM))[1]
# The minimum sample size for simple random sampling
ss4p(N, P, DEFF=1, conf=0.99, cve=0.03, me=0.03, plot=TRUE)
# The minimum sample size for a complex sampling design
ss4p(N, P, DEFF=3.45, conf=0.99, cve=0.03, me=0.03, plot=TRUE)



