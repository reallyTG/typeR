library(KnapsackSampling)


### Name: sampl.mcmc
### Title: Generate feasible solutions to a knapsack problem using Markov
###   Chain Monte Carlo
### Aliases: sampl.mcmc

### ** Examples


#number of variables
N <- 100

#number of variables in each group
grpLen <- 10

#equality matrix
A <- matrix(c(rep(1, N)), ncol=N, byrow=TRUE)

#inequality matrix
G <- matrix(c(rep(1, grpLen), rep(0, N - grpLen),
    rep(c(0,1), each=grpLen), rep(0, N - 2*grpLen)), ncol=N, byrow=TRUE)

#construct a list of list of constraints
constraints <- list(
    list(constr.mat=A, constr.dir=rep("==", nrow(A)), constr.rhs=c(20)),
    list(constr.mat=G, constr.dir=rep("<=", nrow(G)), constr.rhs=c(5, 5)),
    list(constr.mat=G, constr.dir=rep(">=", nrow(G)), constr.rhs=c(1, 2))
)

#generate an initial feasible solution
init <- initState(N, constraints=constraints)

#create feasible solutions to knapsack problems subject to constraints
samples <- sampl.mcmc(init, 50, constraints=constraints)




