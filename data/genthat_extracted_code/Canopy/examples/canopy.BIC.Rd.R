library(Canopy)


### Name: canopy.BIC
### Title: To get BIC as a model selection criterion
### Aliases: canopy.BIC
### Keywords: package

### ** Examples

data(MDA231_sampchain)
sampchain = MDA231_sampchain
projectname = 'MD231'
K = 3:6
numchain = 20
burnin = 150
thin = 5
bic = canopy.BIC(sampchain = sampchain, projectname = projectname, K = K,
                 numchain = numchain, burnin = burnin, thin = thin)



