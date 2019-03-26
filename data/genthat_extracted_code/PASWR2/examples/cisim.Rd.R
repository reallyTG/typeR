library(PASWR2)


### Name: cisim
### Title: Confidence Interval Simulation Program
### Aliases: cisim
### Keywords: programming

### ** Examples

cisim(samples = 100, n = 30, parameter = 100, sigma = 10, conf.level = 0.90)
# Simulates 100 samples of size 30 from  a normal distribution with mean 100
# and a standard deviation of 10.  From the 100 simulated samples, 90% confidence
# intervals for the Mean are constructed and depicted in the graph. 

cisim(100, 30, 100, 10, type = "Var")
# Simulates 100 sample of size 30 from a normal distribution with mean 100
# and a standard deviation of 10.  From the 100 simulated samples, 95% confidence
# intervals for the variance are constructed and depicted in the graph.

cisim(100, 50, 0.5, type = "Pi", conf.level = 0.92)
# Simulates 100 samples of size 50 from a binomial distribution where the 
# population proportion of successes is 0.5.  From the 100 simulated samples,
# 92% confidence intervals for Pi are constructed and depicted in the graph.
 



