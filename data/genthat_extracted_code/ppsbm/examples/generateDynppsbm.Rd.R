library(ppsbm)


### Name: generateDynppsbm
### Title: Data under dynppsbm
### Aliases: generateDynppsbm

### ** Examples

# Generate data from an undirected graph with n=10 individuals and Q=2 clusters

# equal cluster proportions
prop.groups <- c(0.5,0.5)

# 3 different intensity functions :
intens <- list(NULL)
intens[[1]] <- list(intens= function(x) 100*x*exp(-8*x),max=5)
    # (q,l) = (1,1)
intens[[2]] <- list(intens= function(x) exp(3*x)*(sin(6*pi*x-pi/2)+1)/2,max=13)
    # (q,l) = (1,2)
intens[[3]] <- list(intens= function(x) 8.1*(exp(-6*abs(x-1/2))-.049),max=8)
    # (q,l) = (2,2)

# generate data :
obs <- generateDynppsbm(intens,Time=1,n=10,prop.groups,directed=FALSE)

# latent variables (true clustering of the individuals)
obs$z

# number of time events :
length(obs$data$time.seq)

# number of interactions between each pair of individuals:
table(obs$data$type.seq)




