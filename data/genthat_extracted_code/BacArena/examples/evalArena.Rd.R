library(BacArena)


### Name: evalArena
### Title: Function for plotting spatial and temporal change of populations
###   and/or concentrations
### Aliases: evalArena evalArena,Eval-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
arena <- addSubs(arena,40) #add all possible substances
eval <- simEnv(arena,5)
evalArena(eval)
## Not run: 
##D ## if animation package is installed a movie of the simulation can be stored:
##D library(animation)
##D saveVideo({evalArena(eval)},video.name="Ecoli_sim.mp4")
## End(Not run)



