library(BacArena)


### Name: plotCurves2
### Title: Function for plotting the overall change as curves with
###   maximally distinct colors
### Aliases: plotCurves2 plotCurves2,Eval-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
bac <- Bac(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
arena <- Arena(n=20,m=20) #initialize the environment
arena <- addOrg(arena,bac,amount=10) #add 10 organisms
arena <- addSubs(arena,40) #add all possible substances
eval <- simEnv(arena,5)
plotCurves2(eval)



