library(BacArena)


### Name: dat2mat
### Title: Function for transforming the organism data frame to a
###   presence/absence matrix of organisms
### Aliases: dat2mat dat2mat,Arena-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
occmat <- dat2mat(arena)
image(occmat)



