library(statsr)


### Name: bayes_inference
### Title: Bayesian hypothesis tests and credible intervals
### Aliases: bayes_inference

### ** Examples


# inference for the mean from a single normal population using
# Jeffreys Reference prior, p(mu, sigma^2) = 1/sigma^2

library(BayesFactor)
data(tapwater)

# Calculate 95% CI using quantiles from Student t derived from ref prior
bayes_inference(tthm, data=tapwater,
                statistic="mean", 
                type="ci", prior_family="ref",
                method="theoretical")
## No test: 
 
# Calculate 95% CI using simulation from Student t using an informative mean and ref
# prior for sigma^2

bayes_inference(tthm, data=tapwater,
                statistic="mean", mu_0=9.8,
                type="ci",  prior_family="JUI",
                method="theo")

# Calculate 95% CI using simulation  with the 
# Cauchy prior on mu and reference prior on sigma^2


bayes_inference(tthm, data=tapwater,
                statistic="mean", mu_0 = 9.8, rscale=sqrt(2)/2,
                type="ci", prior_family="JZS",
                method="simulation")

                
# Bayesian t-test mu = 0 with ZJS prior  
bayes_inference(tthm, data=tapwater,
                statistic="mean",
                type="ht", alternative="twosided", null=80,
                prior_family="JZS",
                method="sim")
                
               
# Bayesian t-test for two means 

data(chickwts)
chickwts = chickwts[chickwts$feed %in% c("horsebean","linseed"),]
# Drop unused factor levels
chickwts$feed = factor(chickwts$feed)                
bayes_inference(y=weight, x=feed, data=chickwts,
                statistic="mean", mu_0 = 0, alt="twosided",
                type="ht", prior_family="JZS",
                method="simulation")               
## End(No test)



