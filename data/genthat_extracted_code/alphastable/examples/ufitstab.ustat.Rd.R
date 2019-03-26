library(alphastable)


### Name: ufitstab.ustat
### Title: ufitstab.ustat
### Aliases: ufitstab.ustat

### ** Examples

# We are estimating the parameters of a symmetric stable distribution. For this, firstly,
# we simulate a sample of n=100 iid realizations from stable distribution in S_1 parameterization
# with parameters alpha=1.2, beta=0, sigma=1, and mu=0.
x<-urstab(100,1.2,0,1,0,1)
ufitstab.ustat(x)



