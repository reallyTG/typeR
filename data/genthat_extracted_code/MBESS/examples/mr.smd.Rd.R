library(MBESS)


### Name: mr.smd
### Title: Minimum risk point estimation of the population standardized
###   mean difference
### Aliases: mr.smd
### Keywords: design misc htest

### ** Examples

# To obtain pilot sample size in a situation in which A=10000. Note that 'A' is 
# 'structural.cost' divided by the square of 'epsilon'.

# From Chattopadhyay and Kelley (submitted, minor revision requested)
mr.smd(pilot=TRUE, A=10000, sampling.cost=2.4, gamma=.49)

High.SLS <- c(11, 7, 22, 13, 6, 9, 11, 16, 12, 17, 14, 8, 16)
Low.SLS  <- c(3, 6, 10, 8, 14, 5, 12, 10, 6, 8, 13, 5, 9)

mr.smd(d=1.021484, n=13, A=10000, sampling.cost=2.40, gamma=.49)

# Or, using the smd() function:
mr.smd(d=smd(Group.1=High.SLS, Group.2=Low.SLS), n=13, A=10000, sampling.cost=2.40, gamma=.49)

# Here, for this situation, the stopping rule is satisfied:
mr.smd(d=1.00, n=75, A=10000, sampling.cost=2.40, gamma=.49)




