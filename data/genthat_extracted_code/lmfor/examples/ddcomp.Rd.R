library(lmfor)


### Name: ddcomp
### Title: Evaluate the fit of a tree diameter distribution
### Aliases: ddcomp
### Keywords: forest biometrics diameter distributions

### ** Examples

# Example 
# Observed diameters 
d<-c(18.8,24.2,18.7,13.0,18.9,22.4,17.6,22.0,18.8,22.9,
     16.7,13.7,20.6,15.1,31.8,17.2,19.6,16.8,19.3,27.4,
	 23.7,18.2,19.7,18.9,23.0,21.4,23.8,22.1,24.2,20.9)

# Weibull(5,20) distribution in 1 cm classes (class limits from 0,...,60)
f<-pweibull(1:60,5,20)-pweibull(0:59,5,20)

# compare using the classified true distribution (approximate)
ddcomp(d,density=f,limitsd=0:60,limits=0:100,plot=TRUE)

# compare b specifying a Weibull dsitribution (accurate)
ddcomp(d,density="dweibull",shape=5,scale=20,plot=TRUE)



