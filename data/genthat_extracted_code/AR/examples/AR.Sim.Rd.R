library(AR)


### Name: AR.Sim
### Title: Graphical Visualization for Accept-Reject Method
### Aliases: AR.Sim
### Keywords: DISTRIB AR AR.Sim Simulation Accept-Reject method
###   optimization

### ** Examples

# Example 1: 
data = AR.Sim( n = 150, 
         f_X = function(y){dbeta(y,2.7,6.3)},
         Y.dist = "unif", Y.dist.par = c(0,1),
         Rej.Num = TRUE,
         Rej.Rate = TRUE,
         Acc.Rate = FALSE
         ) 

# QQ-plot
q <- qbeta(ppoints(100), 2.7, 6.3)
qqplot(q, data, cex=0.6, xlab="Quantiles of Beta(2.7,6.3)", 
       ylab="Empirical Quantiles of simulated data")
abline(0, 1, col=2)


# ------------------------------------------------------
# Example 2: From Page 54 of (Robert and Casella, 2009)
f_X = function(x) dbeta(x,2.7,6.3)
Simulation1 <- AR.Sim(n=300, f_X, Y.dist = "unif", Y.dist.par = c(0,1)) 
Simulation2 <- AR.Sim(n=2000, f_X, Y.dist="beta", Y.dist.par=c(2,6) ) 
Simulation3 <- AR.Sim(n=1000, f_X, Y.dist="beta", Y.dist.par=c(1.5,3.7) ) 
Simulation4 <- AR.Sim(n=250, f_X, Y.dist="norm", Y.dist.par=c(.5,.2) ) 
Simulation5 <- AR.Sim(n=200,  f_X, Y.dist="exp", Y.dist.par=3 ) 
Simulation6 <- AR.Sim( 400 ,  f_X, Y.dist="gamma", Y.dist.par=c(2,5) ) 

hist(Simulation1, prob=TRUE)#, col="gray20")
hist(Simulation2, prob=TRUE, add=TRUE, col="gray35")
hist(Simulation3, prob=TRUE, add=TRUE, col="gray60")
hist(Simulation4, prob=TRUE, add=TRUE, col="gray75")
hist(Simulation5, prob=TRUE, add=TRUE, col="gray85")
hist(Simulation6, prob=TRUE, add=TRUE, col="gray100")
curve(f_X(x), add=TRUE, col=2, lty=2, lwd=3)

#compare empirical and theoretical percentiles:
p <- seq(.1, .9, .1)
Qhat1 <- quantile(Simulation1, p) #Empirical quantiles of simulated sample 
Qhat2 <- quantile(Simulation2, p) #Empirical quantiles of simulated sample 
Qhat3 <- quantile(Simulation3, p) #Empirical quantiles of simulated sample 
Qhat4 <- quantile(Simulation4, p) #Empirical quantiles of simulated sample 
Qhat5 <- quantile(Simulation5, p) #Empirical quantiles of simulated sample 
Qhat6 <- quantile(Simulation6, p) #Empirical quantiles of simulated sample 
Q <- qbeta(p, 2.7, 6.3)    #Theoretical quantiles of Be(2.7,6.3)
round( rbind(Q, Qhat1, Qhat2, Qhat3, Qhat4, Qhat5, Qhat6), 3)

# Compute p-value of Kolmogorov-Smirnov test:
ks.test(Simulation1, "pbeta", 2.7, 6.3)$p.value
ks.test(Simulation2, "pbeta", 2.7, 6.3)$p.value
ks.test(Simulation3, "pbeta", 2.7, 6.3)$p.value
ks.test(Simulation4, "pbeta", 2.7, 6.3)$p.value
ks.test(Simulation5, "pbeta", 2.7, 6.3)$p.value
ks.test(Simulation6, "pbeta", 2.7, 6.3)$p.value


# ------------------------------------------------------
# Example 3: Simulate Truncated N(5,2^2) at l=3 and r=14 in left and rigth sides, respectively. 

mu = 5
sigma = 2
l = 3
r = 14
n = 400
f_X = function(x)  dnorm(x,mu,sigma) * 
                   as.integer(l<x & x<r) / (pnorm(r,mu,sigma)-pnorm(l,mu,sigma)) 

Sim1 <- AR.Sim(n, f_X, S_X=c(l,r), Y.dist="norm", Y.dist.par=c(5,4), xlim=c(l-1,r+1) ) 
head(Sim1, 15)
hist(Sim1, prob=TRUE, col="lightgreen")
curve(f_X(x), add=TRUE, col=2, lty=2, lwd=3) # Truncated pdf of N(5,2^2) at l and r
c2 = 1 / (pnorm(r,mu,sigma)-pnorm(l,mu,sigma)) ; c2 #See page 15 jozve




