library(flars)


### Name: fccaXX
### Title: Canonical correlation analysis between two groups of mixed
###   functional and scalar variables
### Aliases: fccaXX

### ** Examples

# library(flars)
# library(fda)
## Generate some data sets.
# dataL1=data_generation(seed = 1,uncorr = FALSE,nVar = 8,nsamples = 120,
#       var_type = 'm',cor_type = 1)
# dataL1=dataL1$x

# dataL2=data_generation(seed = 2,uncorr = FALSE,nVar = 8,nsamples = 120,
#       var_type = 'm',cor_type = 1)
# dataL2=dataL2$x

## cross validation
# outCV=fccaXXcv(xL1 = dataL1[1:2], xL2 = dataL2[1:2], method = 'basis'
#      ,alpha = 10^seq(-6,0,len=5))

# cvCor=outCV$cor  
# calculate the correlation
# out=fccaXX(dataL1, dataL2, method = 'basis',control1 = list(pen1=
#      outCV$alpha[which.max(cvCor)]),control2 = list(pen1=
#      outCV$alpha[which.max(cvCor)]))




