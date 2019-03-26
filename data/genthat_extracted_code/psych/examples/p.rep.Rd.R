library(psych)


### Name: p.rep
### Title: Find the probability of replication for an F, t, or r and
###   estimate effect size
### Aliases: p.rep p.rep.f p.rep.t p.rep.r
### Keywords: models univar

### ** Examples


p.rep(.05)  #probability of replicating a result if the original study had a  p = .05
p.rep.f(9.0,98)  #probability of replicating  a result with F = 9.0 with 98 df
p.rep.r(.4,50)    #probability of replicating a result if r =.4 with n = 50
p.rep.t(3,98)   #probability of replicating a result if t = 3 with df =98
p.rep.t(2.14,84,14) #effect of equal sample sizes (see Rosnow et al.)




