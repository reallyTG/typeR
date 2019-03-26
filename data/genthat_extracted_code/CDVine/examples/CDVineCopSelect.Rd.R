library(CDVine)


### Name: CDVineCopSelect
### Title: Sequential copula selection and estimation of C- and D-vine
###   copula models
### Aliases: CDVineCopSelect

### ** Examples

# simulate from a 4-dimensional D-vine copula with mixed pair-copulas
d = 4
dd = d*(d-1)/2
family = c(1,2,3,4,7,3)
par = c(0.5,0.4,2,1.5,1.2,1.5)
par2 = c(0,5,0,0,2,0)
type = 2
simdata = CDVineSim(1000,family,par,par2,type)

# determine appropriate pair-copula families and parameters
# of a D-vine structure
## Not run: 
##D CDVineCopSelect(simdata,type=2,familyset=c(1:10,13,14,23,24))
## End(Not run)



