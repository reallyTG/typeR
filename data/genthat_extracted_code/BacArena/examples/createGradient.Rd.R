library(BacArena)


### Name: createGradient
### Title: Change substance concentration patterns in the environment
###   according to a gradient
### Aliases: createGradient createGradient,Arena-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
arena <- addSubs(arena,30) #add all substances with no concentrations.
arena <- createGradient(arena,smax=50,mediac=c("EX_glc(e)","EX_o2(e)","EX_pi(e)"),
             position='top',steep=0.5, add=FALSE)



