library(expoRkit)


### Name: orani
### Title: Australia Economic Model data, 1968-68.
### Aliases: orani
### Keywords: data datasets

### ** Examples

data(orani)  ## Load the data as a 'dgCMatrix' (CCS format)
v <- rep(1, 2529)
### Solving a system of 2529 coupled linear differential equations
system.time(wCCS <- expv(orani, v = v, t = 10))
oraniCOO <- as(orani, "TsparseMatrix")  ## Coerce to COO format
### In this case, the COO format gives a slight increase in
### computational time as reported in Sidje (1998).
system.time(wCOO <- expv(oraniCOO, v = v, t = 10))

print(cbind(wCCS[1:5], wCOO[1:5]), digits = 14)



