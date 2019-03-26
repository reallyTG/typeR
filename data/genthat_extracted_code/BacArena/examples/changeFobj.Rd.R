library(BacArena)


### Name: changeFobj
### Title: Function for changing the objective function of the model
### Aliases: changeFobj changeFobj,Human-method

### ** Examples

data(Ec_core, envir = environment()) #get Escherichia coli core metabolic model
human <- Human(Ec_core,deathrate=0.05,
           minweight=0.05,growtype="exponential") #initialize a bacterium
changeFobj(human,'EX_glc(e)',Ec_core)



