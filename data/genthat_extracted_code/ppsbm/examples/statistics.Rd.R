library(ppsbm)


### Name: statistics
### Title: Compute statistics
### Aliases: statistics

### ** Examples

# Convert the generated data into the statistics matrix N_ijk with 8 columns

n <- 50
Dmax <- 2^3

obs <- statistics(generated_Q3$data,n,Dmax,directed=FALSE)




