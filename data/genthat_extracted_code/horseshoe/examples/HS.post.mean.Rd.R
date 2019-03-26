library(horseshoe)


### Name: HS.post.mean
### Title: Posterior mean for the horseshoe for the normal means problem.
### Aliases: HS.post.mean

### ** Examples


#Plot the posterior mean for a range of deterministic values
y <- seq(-5, 5, 0.05)
plot(y, HS.post.mean(y, tau = 0.5, Sigma2 = 1))

#Example with 20 signals, rest is noise
#Posterior mean for the signals is plotted in blue
truth <- c(rep(0, 80), rep(8, 20))
data <-  truth + rnorm(100)
tau.example <- HS.MMLE(data, 1)
plot(data, HS.post.mean(data, tau.example, 1),
 col = c(rep("black", 80), rep("blue", 20)))





