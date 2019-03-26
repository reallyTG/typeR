library(PASWR)


### Name: CIsim
### Title: Confidence Interval Simulation Program
### Aliases: CIsim
### Keywords: distribution

### ** Examples

CIsim(100, 30, 100, 10)
    # Simulates 100 samples of size 30 from 
    # a normal distribution with mean 100
    # and standard deviation 10.  From the
    # 100 simulated samples, 95% confidence
    # intervals for the Mean are constructed 
    # and depicted in the graph. 

CIsim(100, 30, 100, 10, type="Var")
    # Simulates 100 samples of size 30 from 
    # a normal distribution with mean 100
    # and standard deviation 10.  From the
    # 100 simulated samples, 95% confidence
    # intervals for the variance are constructed 
    # and depicted in the graph.
    
CIsim(100, 50, .5, type="Pi", conf.level=.90)     
    # Simulates 100 samples of size 50 from 
    # a binomial distribution where the population
    # proportion of successes is 0.5.  From the
    # 100 simulated samples, 90% confidence
    # intervals for Pi are constructed 
    # and depicted in the graph.  



