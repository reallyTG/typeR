library(samplesize4surveys)


### Name: ss4dpH
### Title: The required sample size for testing a null hyphotesis for a
###   single difference of proportions
### Aliases: ss4dpH

### ** Examples

ss4dpH(N = 100000, P1 = 0.5, P2 = 0.55, D=0.03)
ss4dpH(N = 100000, P1 = 0.5, P2 = 0.55, D=0.03, plot=TRUE)
ss4dpH(N = 100000, P1 = 0.5, P2 = 0.55, D=0.03, DEFF = 2, plot=TRUE)
ss4dpH(N = 100000, P1 = 0.5, P2 = 0.55, D=0.03, conf = 0.99, power = 0.9, DEFF = 2, plot=TRUE)

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

# The minimum sample size for testing 
# H_0: P_1 - P_2 = 0   vs.   H_a: P_1 - P_2 = D = 0.05
D = 0.05  
ss4dpH(N, P1, P2, D, DEFF = 2, plot=TRUE)

# The minimum sample size for testing 
# H_0: P - P_0 = 0   vs.   H_a: P - P_0 = D = 0.02
D = 0.01
ss4dpH(N, P1, P2, D, conf = 0.99, power = 0.9, DEFF = 3.45, plot=TRUE)



