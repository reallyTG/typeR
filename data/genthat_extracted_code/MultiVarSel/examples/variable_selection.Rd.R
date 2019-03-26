library(MultiVarSel)


### Name: variable_selection
### Title: This function allows the user to select the most relevant
###   variables thanks to the estimation of their selection frequencies
###   obtained by the stability selection approach.
### Aliases: variable_selection

### ** Examples

data("copals_camera")
Y <- scale(Y[,1:50])
Frequencies <- variable_selection(Y = Y, group = group,
 nb_repli = 10, typeDep = 'AR1', pAR = 1, qMA = 0, nb.cores = 1, parallel = FALSE)



