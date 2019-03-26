library(rbtt)


### Name: rbtt
### Title: Perform robust bootstrapped t-tests
### Aliases: rbtt

### ** Examples

x=rbinom(50,1,0.5)*rlnorm(50,0,1)
y=rbinom(150,1,0.3)*rlnorm(150,2,1)

rbtt(x, y, n.boot=999)

# Perform bootstrap resamples on 2 cores
rbtt(x, y, n.boot=999, n.cores=2)

# Use methods 1 or 2 individually
rbtt(x, y, n.boot = 999, method = 1)
rbtt(x, y, n.boot = 999, method = 2)

# Use a confidence level of 0.99
rbtt(x, y, n.boot = 999, conf.level = 0.99)



