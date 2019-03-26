library(BacArena)


### Name: changeOrg
### Title: Change organisms in the environment
### Aliases: changeOrg changeOrg,Arena-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
neworgdat <- arena@orgdat #get the current orgdat
neworgdat <- neworgdat[-1,] #remove the first individual
arena <- changeOrg(arena,neworgdat)



