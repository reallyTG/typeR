library(BacArena)


### Name: constrain
### Title: Function for constraining the models based on metabolite
###   concentrations
### Aliases: constrain constrain,Organism-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
org <- Organism(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize an organism
lobnds <- constrain(org,org@medium,org@lbnd[org@medium],1,1,1,1,1)



