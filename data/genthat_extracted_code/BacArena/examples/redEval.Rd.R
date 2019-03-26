library(BacArena)


### Name: redEval
### Title: Function for reducing the size of an Eval object by collapsing
###   the medium concentrations
### Aliases: redEval redEval,Eval-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
arena <- addSubs(arena,40) #add all possible substances
eval <- simEnv(arena,5)
eval_reduce <- redEval(eval,5)



