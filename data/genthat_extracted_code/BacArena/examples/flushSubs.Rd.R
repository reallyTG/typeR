library(BacArena)


### Name: flushSubs
### Title: Remove all substances in the environment
### Aliases: flushSubs flushSubs,Arena-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
arena <- addSubs(arena, smax=40) #add all substances with no concentrations.
arena <- changeSub(arena,20,c("EX_glc(e)","EX_o2(e)","EX_pi(e)")) 
#add substances glucose, oxygen and phosphate
arena <- flushSubs(arena) #remove all created substance concentrations



