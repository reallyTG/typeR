library(scaleboot)


### Name: sboptions
### Title: Options for Multiscale Bootstrap
### Aliases: sboptions
### Keywords: environment models

### ** Examples

sboptions() # show all the options
sboptions("models") # show the default model names
new.models <- sbmodelnames(m=1:2) # character vector c("poly.1","poly.2")
old.models <- sboptions("models",new.models) # set the new model names
sboptions("models") # show the default model names
sboptions("models",old.models) # set back the default value
sboptions("models") # show the default model names



