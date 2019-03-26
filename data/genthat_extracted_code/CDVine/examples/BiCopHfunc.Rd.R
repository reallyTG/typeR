library(CDVine)


### Name: BiCopHfunc
### Title: Conditional distribution function (h-function) of a bivariate
###   copula
### Aliases: BiCopHfunc

### ** Examples

## Example 1: 4-dimensional C-vine model with mixed pair-copulas
data(worldindices)
Data = as.matrix(worldindices)[,1:4]
d = dim(Data)[2]
fam = c(5,1,3,14,3,2)

# sequential estimation
seqpar1 = CDVineSeqEst(Data,fam,type=1,method="itau")

# calculate the inputs of the second tree using h-functions
h1 = BiCopHfunc(Data[,1],Data[,2],fam[1],seqpar1$par[1])
h2 = BiCopHfunc(Data[,1],Data[,3],fam[2],seqpar1$par[2])
h3 = BiCopHfunc(Data[,1],Data[,4],fam[3],seqpar1$par[3])

# compare estimated parameters
BiCopEst(h1$hfunc1,h2$hfunc1,fam[4],method="itau")
seqpar1$par[4]

BiCopEst(h1$hfunc1,h3$hfunc1,fam[5],method="itau")
seqpar1$par[5]


## Example 2: 4-dimensional D-vine model with mixed pair-copulas

# sequential estimation
seqpar2 = CDVineSeqEst(Data,fam,type=2,method="itau")

# calculate the inputs of the second tree using h-functions
h1 = BiCopHfunc(Data[,1],Data[,2],fam[1],seqpar2$par[1])
h2 = BiCopHfunc(Data[,2],Data[,3],fam[2],seqpar2$par[2])
h3 = BiCopHfunc(Data[,3],Data[,4],fam[3],seqpar2$par[3])

# compare estimated parameters
BiCopEst(h1$hfunc2,h2$hfunc1,fam[4],method="itau")
seqpar2$par[4]

BiCopEst(h2$hfunc2,h3$hfunc1,fam[5],method="itau")
seqpar2$par[5]



