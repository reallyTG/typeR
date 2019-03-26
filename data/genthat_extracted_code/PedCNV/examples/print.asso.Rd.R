library(PedCNV)


### Name: print.asso
### Title: Prints association study results
### Aliases: print.asso

### ** Examples

# Fit the data under the assumption that there are 3 clusters
asso.fit <- AssoTestProc(signal=signal,fam=fam,envirX=envirX,phi=phi,N=3,varSelection='PC.9')
print(asso.fit)



