library(MSPRT)


### Name: find.umpbt.t
### Title: The UMPBT alternative in a T-test
### Aliases: find.umpbt.t

### ** Examples

# a simulated ordered data at step-30
x.seq = rnorm(30,2,1.5)

# UMPBT alternative at step-30

## providing the data x.seq
find.umpbt.t(n.obs= 60, obs= x.seq)

## providing the sd of x.seq
find.umpbt.t(n.obs= 60, s= sd(x.seq) )



