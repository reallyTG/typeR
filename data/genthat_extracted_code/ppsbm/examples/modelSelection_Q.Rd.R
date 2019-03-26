library(ppsbm)


### Name: modelSelection_Q
### Title: Selects the number of groups with ICL
### Aliases: modelSelection_Q

### ** Examples

# load data of a synthetic graph with 50 individuals and 3 clusters
n <- 50

# compute data matrix with precision d_max=3
Dmax <- 2^3
data <- list(Nijk=statistics(generated_Q3$data,n,Dmax,directed=FALSE),
    Time=generated_Q3$data$Time)

# ICL-model selection
sol.selec_Q <- modelSelection_Q(data,n,Qmin=1,Qmax=4,directed=FALSE,
    sparse=FALSE,generated_sol_hist)

# best number Q of clusters:
sol.selec_Q$Qbest




