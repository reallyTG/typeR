library(sspse)


### Name: summary.sspse
### Title: Summarizing Population Size Estimation Model Fits
### Aliases: summary.sspse
### Keywords: models

### ** Examples


N0 <- 200
n <- 100
K <- 10

# Create probabilities for a Waring distribution 
# with scaling parameter 3 and mean 5, but truncated at K=10.
probs <- c(0.33333333,0.19047619,0.11904762,0.07936508,0.05555556,
           0.04040404,0.03030303,0.02331002,0.01831502,0.01465201)
probs <- probs / sum(probs)

#
# Create a sample
#
set.seed(1)
pop<-sample(1:K, size=N0, replace = TRUE, prob = probs)
s<-sample(pop, size=n, replace = FALSE, prob = pop)
 
# Here interval=1 so that it will run faster. It should be higher in a 
# real application.
out <- posteriorsize(s=s,interval=1)
plot(out, HPD.level=0.9,data=pop[s])
summary(out, HPD.level=0.9)
# Let's look at some MCMC diagnostics
plot(out, HPD.level=0.9,mcmc=TRUE)




