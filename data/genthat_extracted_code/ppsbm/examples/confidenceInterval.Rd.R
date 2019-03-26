library(ppsbm)


### Name: confidenceInterval
### Title: Confidence Interval
### Aliases: confidenceInterval

### ** Examples


# data of a synthetic graph with 50 individuals and 3 clusters

n <- 50
Q <- 3

Time <- generated_Q3$data$Time
data <- generated_Q3$data
z <- generated_Q3$z

Dmax <- 2^3

# VEM-algo hist
sol.hist <- mainVEM(list(Nijk=statistics(data,n,Dmax,directed=FALSE),Time=Time),
     n,Qmin=3,directed=FALSE,method='hist',d_part=1,n_perturb=0)[[1]]

# compute bootstrap confidence bands
boot <- bootstrap_and_CI(sol.hist,Time,R=5,alpha=0.1,nbcores=1,d_part=1,n_perturb=0,
     directed=FALSE)

boot.sol <- boot$boot.sol

confidenceInterval(boot.sol)




