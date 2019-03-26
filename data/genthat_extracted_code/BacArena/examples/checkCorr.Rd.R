library(BacArena)


### Name: checkCorr
### Title: Function to show correlations of a simulated organism or
###   substrate
### Aliases: checkCorr checkCorr,Eval-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
arena <- addSubs(arena,40) #add all possible substances
eval <- simEnv(arena,5)
checkCorr(eval, tocheck="o2")



