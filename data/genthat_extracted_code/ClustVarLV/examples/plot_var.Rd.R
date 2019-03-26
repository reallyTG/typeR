library(ClustVarLV)


### Name: plot_var
### Title: Representation of the variables and their group membership
### Aliases: plot_var

### ** Examples

data(apples_sh)
resclvX <- CLV(X = apples_sh$senso, method = 1, sX = TRUE)
plot_var(resclvX, K = 4, axeh = 1, axev = 2)




