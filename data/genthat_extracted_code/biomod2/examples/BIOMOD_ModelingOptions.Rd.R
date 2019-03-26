library(biomod2)


### Name: BIOMOD_ModelingOptions
### Title: Configure the modeling options for each selected model
### Aliases: BIOMOD_ModelingOptions
### Keywords: models options

### ** Examples

# default BIOMOD.model.option object
myBiomodOptions <- BIOMOD_ModelingOptions()

# print the object
myBiomodOptions

# you can copy a part of the print, change it and custom your options 
# here we want to compute quadratic GLM and select best model with 'BIC' criterium
myBiomodOptions <- BIOMOD_ModelingOptions(
                      GLM = list( type = 'quadratic',
                                  interaction.level = 0,
                                  myFormula = NULL,
                                  test = 'BIC',
                                  family = 'binomial',
                                  control = glm.control(epsilon = 1e-08, 
                                              maxit = 1000, 
                                              trace = FALSE) ))
                                  
# check changes was done
myBiomodOptions

# you can prefer to establish your own GLM formula
myBiomodOptions <- BIOMOD_ModelingOptions(
                    GLM = list( myFormula = formula("Sp277 ~ bio3 + 
                    log(bio10) + poly(bio16,2) + bio19 + bio3:bio19")))

# check changes was done
myBiomodOptions

# you also can directly print default parameters and then follow the same processus
Print_Default_ModelingOptions()




