library(adehabitatHR)


### Name: estUD-class
### Title: Class "estUD": Storing Utilization Distributions in R
### Aliases: estUD-class coerce,estUD,data.frame-method show,estUD-method
### Keywords: classes

### ** Examples


## load the data
data(puechabonsp)

## estimate one UD for each animal
jj <- kernelUD(puechabonsp$relocs[,1])
image(jj)
jj


## Consider the first animal
jj[[1]]
class(jj[[1]])
image(jj[[1]])





