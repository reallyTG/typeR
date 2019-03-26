library(bandit)


### Name: best_binomial_bandit
### Title: best_binomial_bandit
### Aliases: best_binomial_bandit bbb
### Keywords: htest design

### ** Examples

x=c(10,20,30,50)
n=c(100,102,120,130)
arm_probabilities = best_binomial_bandit(x,n)
print(arm_probabilities)
paste("The best arm is likely ", which.max(arm_probabilities), ", with ",
	round(100*max(arm_probabilities), 2), " percent probability of being the best.", sep="")

best_binomial_bandit(c(2,20),c(100,1000))

best_binomial_bandit(c(2,20),c(100,1000), alpha = 2, beta = 5)

#quick look at the various shapes of the beta distribution as we change the shape params:
AlphaBeta = cbind(alpha=c(0.5,5,1,2,2),beta=c(0.5,1,3,2,5))
M = nrow(AlphaBeta)
y= matrix(0,100,ncol=M)
x = seq(0,1,length=100)
for (i in 1:M) y[,i] = dbeta(x,AlphaBeta[i,1],AlphaBeta[i,2])
matplot(x,y,type="l", ylim = c(0,3.5), lty=1, lwd=2)
param_strings = paste("a=", AlphaBeta[,"alpha"], ", b=", AlphaBeta[,"beta"], sep="")
legend("top", legend = param_strings, col=1:M, lty=1)



