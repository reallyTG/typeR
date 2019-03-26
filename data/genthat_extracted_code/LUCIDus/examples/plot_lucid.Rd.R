library(LUCIDus)


### Name: plot_lucid
### Title: Plot Sankey diagram for integrative clustering
### Aliases: plot_lucid

### ** Examples

# Run the model with covariates in the G->X path
IntClusCoFit1 <- est_lucid(G=G1,CoG=CoG,Z=Z1,Y=Y1,K=2,family="binary",Pred=TRUE)

# Visualize the results of integrative clustering
plot_lucid(IntClusCoFit1)



