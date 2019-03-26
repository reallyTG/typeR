library(alphastable)


### Name: mfitstab.ustat
### Title: mfitstab.ustat
### Aliases: mfitstab.ustat

### ** Examples

# Here, for example, we are interested to estimate the parameters of a bivariate
# stable distribution. For this, two sets of n=400 iid realizations which are
# assumed to distributed jointly as a strictly bivariate stable distribution with
# tail index alpha=1.2 are simulated. Considering m=4, masses of the discrete spectral
# measure are addressed by s_j=(cos(2*pi(j-1)/m), sin (2*pi(j-1)/m)); for j=1,...,4.
library("nnls")
x1<-urstab(400,1.2,-0.50,1,0,0)
x2<-urstab(400,1.2,0.50,0.5,0,0)
z<-cbind(x1,x2)
mfitstab.ustat(z,4,1)



