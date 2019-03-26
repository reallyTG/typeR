library(asypow)


### Name: asypow.n
### Title: Asymptotic Sample Size
### Aliases: asypow.n
### Keywords: htest

### ** Examples

# Three Sample Poisson Example :
#    Three independent Poisson processes produce events at
#    mean rates of 1, 2 and 3 per day. For how many days
#    must the processes be observed to have an 80% chance
#    of detecting that the means are different at an
#    overall significance level of 0.05?
# Step 1 : Find the information matrix
pois.mean <- c(1,2,3)
info.pois <- info.poisson.kgroup(pois.mean, group.size=3)
# Step 2: Create the constraints matrix
constraints <- matrix(c(2,1,2,2,2,3),ncol=3,byrow=TRUE)
# Step 3: Find the noncentrality parameter and
#         degrees of freedom for the test
poisson.object <- asypow.noncent(pois.mean, info.pois, constraints)
# Step 4: Compute sample size needed for 
#         0.8 power with significance level 0.05
n.pois <- asypow.n(poisson.object, 0.8, 0.05)
# Step 5: Divide the sample size by 3 (the number of processes)
#         to get the number of days required.
n.days <- n.pois/3
print(n.days)



