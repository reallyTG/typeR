library(asypow)


### Name: asypow.noncent
### Title: Asymptotic Noncentrality Parameter
### Aliases: asypow.noncent
### Keywords: htest

### ** Examples

# Three Sample Poisson Example :
#    Three independent Poisson processes produce events at
#    mean rates of 1, 2 and 3 per day. 
# Find the information matrix
pois.mean <- c(1,2,3)
info.pois <- info.poisson.kgroup(pois.mean,group.size=3)
# Create the constraints matrix
constraints <- matrix(c(2,1,2,2,2,3),ncol=3,byrow=TRUE)
# Calculate noncentrality parameter, degrees of freedom and parameter
# value estimates under the null hypothesis for the test.
poisson.object <- asypow.noncent(pois.mean,info.pois,constraints)



