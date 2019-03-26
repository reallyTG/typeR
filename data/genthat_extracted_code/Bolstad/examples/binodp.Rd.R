library(Bolstad)


### Name: binodp
### Title: Binomial sampling with a discrete prior
### Aliases: binodp
### Keywords: misc

### ** Examples


## simplest call with 6 successes observed in 8 trials and a uniform prior
binodp(6,8)

## same as previous example but with more possibilities for pi
binodp(6, 8, n.pi = 100)

## 6 successes, 8 trials and a non-uniform discrete prior
pi = seq(0, 1, by = 0.01)
pi.prior = runif(101)
pi.prior = sort(pi.prior / sum(pi.prior))
binodp(6, 8, pi, pi.prior)

## 5 successes, 6 trials, non-uniform prior
pi = c(0.3, 0.4, 0.5)
pi.prior = c(0.2, 0.3, 0.5)
results = binodp(5, 6, pi, pi.prior)

## plot the results from the previous example using a side-by-side barplot
results.matrix = rbind(results$pi.prior,results$posterior)
colnames(results.matrix) = pi
barplot(results.matrix, col = c("red", "blue"), beside = TRUE,
	      xlab = expression(pi), ylab=expression(Probability(pi)))
box()
legend("topleft", bty = "n", cex = 0.7, 
       legend = c("Prior", "Posterior"), fill = c("red", "blue"))




