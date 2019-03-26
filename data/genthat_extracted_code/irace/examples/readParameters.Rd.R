library(irace)


### Name: readParameters
### Title: readParameters
### Aliases: readParameters

### ** Examples

 ## Read the parameters directly from text
 parameters.table <- 'tmax "" i (2, 10)
 temp "" r (10, 50)
 '
 parameters <- readParameters(text=parameters.table)
 parameters




