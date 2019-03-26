library(horseshoe)


### Name: HS.post.var
### Title: Posterior variance for the horseshoe for the normal means
###   problem.
### Aliases: HS.post.var

### ** Examples


#Plot the posterior variance for a range of deterministic values
y <- seq(-8, 8, 0.05)
plot(y, HS.post.var(y, tau = 0.05, Sigma2 = 1))

#Example with 20 signals, rest is noise
#Posterior variance for the signals is plotted in blue
#Posterior variance for the noise is plotted in black
truth <- c(rep(0, 80), rep(8, 20))
data <-  truth + rnorm(100)
tau.example <- HS.MMLE(data, 1)
plot(data, HS.post.var(data, tau.example, 1),
 col = c(rep("black", 80), rep("blue", 20)) )




