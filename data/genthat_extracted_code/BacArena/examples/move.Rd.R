library(BacArena)


### Name: move
### Title: Function for random movement of organisms
### Aliases: move move,Organism-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
arena <- addSubs(arena,40) #add all possible substances
move(bac,n=20,m=20,j=1,pos=arena@orgdat[,c('x','y')], occupyM=arena@occupyM)



