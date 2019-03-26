library(RTDE)


### Name: RTDE
### Title: Data object used for a Tail Dependence model
### Aliases: RTDE summary.RTDE print.RTDE plot.RTDE prob prob.default
###   prob.RTDE
### Keywords: distribution

### ** Examples


#####
# (1) simulation

n <- 100
x <- RTDE(simu=list(nb=n, marg="ufrechet", cop="indep", replicate=1),
	nbpoint=10:11, alpha=0, omega=1/2)
x	
summary(x)





