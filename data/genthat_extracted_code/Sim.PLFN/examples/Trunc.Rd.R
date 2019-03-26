library(Sim.PLFN)


### Name: Trunc
### Title: Simulation from a Truncated Distribution
### Aliases: Trunc
### Keywords: PLFN S.PLFN

### ** Examples

# Truncated Normal Distribution: 

data1 = Trunc(n=10^4, T.dist="norm", T.dist.par=c(5,2), L=3, R=10)
hist(data1)

data2 = Trunc(n=1000, T.dist="chisq", T.dist.par=4, L=0, R=12)
hist(data2)

data3 = Trunc(n=10^4, T.dist="norm", T.dist.par=c(5,2), L=3) 
hist(data3)



