library(TreePar)


### Name: bd.shifts.optim
### Title: bd.shifts.optim: Estimating speciation and extinction rate
###   changes and mass extinction events in phylogenies.
### Aliases: bd.shifts.optim

### ** Examples

set.seed(1)

# First we simulate a tree, and then estimate the parameters for the tree:
# Number of species
nspecies <- 20
# At time 1 and 2 in the past, we have a rate shift:
time <- c(0,1,2)
# Mass extinction intensities 0.5 at time 1 in past, 0.4 at time 2 in past. 
# Present day species are all sampled (rho[1]=1):
rho <- c(1,0.5,0.4)
# speciation rates (between t[i],t[i+1] we have speciation rate lambda[i]):
lambda <- c(2,2,1)
# extinction rates (between t[i],t[i+1] we have extinction rate mu[i]):
mu <- c(1,1,0)
# Simulation of a tree:
tree<-sim.rateshift.taxa(nspecies,1,lambda,mu,frac=rho,times=time,complete=FALSE)
# Extracting the speciation times x:
x<-sort(getx(tree[[1]]),decreasing=TRUE)

# When estimating the the rate shift times t based on branching times x, 
# we allow the shift times to be 0.6, 0.8, 1, 1.2, .. ,2.4:
start <- 0.6
end <- 2.4
grid <- 0.2

## No test: 
# We fix rho and estimate time, lambda, mu:
res <- bd.shifts.optim(x,rho,grid,start,end)[[2]]
res
# res[[2]] tells us about the maximum likelihood estimate given one rate shift:
# - log lik = 17.330862988.
# rate shift at time 2.2.
# turnover (extinction/speciation) = 0.186301549 more recent than 2.2,
#     and = 0.939681843 more ancestral than 2.2.
# net diversification (speciation-extinction) rate = 0.958947381 more recent than 2.2, 
#     and = 0.000100009 more ancestral than 2.2.

#test if i shifts explain the tree significantly better than i-1 shifts, here i=1:
i<-1
test<-pchisq(2*(res[[i]][1]-res[[i+1]][1]),3)
#if test>0.95 then i shifts is significantly better than i-1 shifts at a 5% error

# We fix rho=1 and mu=0 and then estimate time, lambda:
resyule <- bd.shifts.optim(x,rho,grid,start,end,yule=TRUE)
resyule[[2]]
# We estimate time, rho, lambda, mu:
resrho <- bd.shifts.optim(x,rho,grid,start,end,ME=TRUE)
resrho[[2]]
# Data analysis in Stadler & Bokma, 2012:
# Number of species in each order from Sibley and Monroe (1990)
data(bird.orders)
S <- c(10, 47, 69, 214, 161, 17, 355, 51, 56, 10, 39, 152, 6, 143, 
358, 103, 319, 23, 291, 313, 196, 1027, 5712)
groups<-get.groups(bird.orders,S,0)
groupscut<-get.groups(bird.orders,S,96.43)
x<-branching.times(bird.orders)
# transforming molecular timescale into calendar timescale
groups[,1]<-groups[,1]/0.207407
x<-x/0.207407 
bd.shifts.optim(x,sampling=c(1),survival=1,groups=groups)[[2]]
bd.shifts.optim(x,sampling=c(1),survival=1,groups=groupscut)[[2]]
# allowing one shift in rates:
bd.shifts.optim(x,sampling=c(1,1),grid=1,start=20,end=25,survival=1,groups=groupscut)[[2]]
## End(No test)



