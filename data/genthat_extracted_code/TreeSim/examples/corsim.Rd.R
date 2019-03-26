library(TreeSim)


### Name: corsim
### Title: corsim: Simulating the missing speciation events in an
###   incomplete phylogenies.
### Aliases: corsim

### ** Examples

# Speciation times of a tree with five species:
x<-c(1,1.5,3,5)
# We simulate using the following parameters:
lambda<-2
mu<-1
tyoung<-0.5
told<-4.5
# We simulate 5 additional speciation times (i.e. five additional species):
missing<-5

# xcompleted is x plus 5 additional speciation events between 0.5 and 4.5 timesteps 
# in the past. xcompleted corresponds to a 10-species tree:
xcompleted<-corsim(x,lambda,mu,missing,told,tyoung)



