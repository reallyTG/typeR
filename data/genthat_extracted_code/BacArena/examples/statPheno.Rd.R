library(BacArena)


### Name: statPheno
### Title: Function for investigating a specific phenotype of an organism
### Aliases: statPheno statPheno,Eval-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
arena <- addSubs(arena,40) #add all possible substances
eval <- simEnv(arena,5)
statPheno(eval, type_nr=1, phenotype_nr=2)



