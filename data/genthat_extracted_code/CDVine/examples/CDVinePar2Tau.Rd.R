library(CDVine)


### Name: CDVinePar2Tau
### Title: Kendall's tau values of a vine copula model
### Aliases: CDVinePar2Tau

### ** Examples

# specify the vine
fam3 = c(5,1,3,14,3,2)
par3 = c(0.9,0.3,0.2,1.1,0.2,0.7)
nu3 = c(0,0,0,0,0,7)

# compute the corresponding Kendall's tau values 
tau = CDVinePar2Tau(fam3,par3,nu3)



