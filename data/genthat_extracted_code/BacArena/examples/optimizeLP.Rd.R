library(BacArena)


### Name: optimizeLP
### Title: Function for computing the linear programming according to the
###   model structure
### Aliases: optimizeLP optimizeLP,Organism-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
org <- Organism(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a organism
org@fbasol <- optimizeLP(org)



