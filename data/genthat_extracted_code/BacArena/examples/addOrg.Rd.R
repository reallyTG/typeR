library(BacArena)


### Name: addOrg
### Title: Add individuals to the environment
### Aliases: addOrg addOrg,Arena-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms

# Alternative way: adding organisms by giving matrix with positions
arena <- Arena(n=20,m=20)
mat <- matrix(sample(c(0,1), 400, replace = TRUE), nrow = 20, ncol = 20)
bac <- Bac(Ec_core)
arena <- addOrg(arena, specI=bac, posmat = mat)




