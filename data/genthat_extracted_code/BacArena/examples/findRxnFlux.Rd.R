library(BacArena)


### Name: findRxnFlux
### Title: Function to get all reactions fluxes that are associated with
###   the metabolite of a given exchange reactions
### Aliases: findRxnFlux findRxnFlux,Eval-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
arena <- addSubs(arena,40) #add all possible substances
eval <- simEnv(arena,5)
fluxlist <- findRxnFlux(eval, "EX_h(e)", 5)



