library(gemtc)


### Name: mtc.run
### Title: Running an 'mtc.model' using an MCMC sampler
### Aliases: mtc.run mtc.result summary.mtc.result plot.mtc.result
###   forest.mtc.result print.mtc.result as.mcmc.list.mtc.result

### ** Examples

model <- mtc.model(smoking)

## Not run: results <- mtc.run(model, thin=10)
results <- dget(system.file("extdata/luades-smoking.samples.gz", package="gemtc"))

# Convergence diagnostics
gelman.plot(results)

# Posterior summaries
summary(results)
## Iterations = 5010:25000
## Thinning interval = 10 
## Number of chains = 4 
## Sample size per chain = 2000 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##         Mean     SD Naive SE Time-series SE
## d.A.B 0.4965 0.4081 0.004563       0.004989
## d.A.C 0.8359 0.2433 0.002720       0.003147
## d.A.D 1.1088 0.4355 0.004869       0.005280
## sd.d  0.8465 0.1913 0.002139       0.002965
## 
## 2. Quantiles for each variable:
## 
##          2.5%    25%    50%    75% 97.5%
## d.A.B -0.2985 0.2312 0.4910 0.7530 1.341
## d.A.C  0.3878 0.6720 0.8273 0.9867 1.353
## d.A.D  0.2692 0.8197 1.0983 1.3824 2.006
## sd.d   0.5509 0.7119 0.8180 0.9542 1.283

plot(results) # Shows time-series and density plots of the samples
forest(results) # Shows a forest plot



