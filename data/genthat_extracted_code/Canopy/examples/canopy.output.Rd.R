library(Canopy)


### Name: canopy.output
### Title: To generate a posterior tree
### Aliases: canopy.output
### Keywords: package

### ** Examples

data(MDA231_sampchain)
data(MDA231)
sampchain = MDA231_sampchain
projectname = 'MD231'
K = 3:6
numchain = 20
burnin = 150
thin = 5
optK = 4
C = MDA231$C
post = canopy.post(sampchain = sampchain, projectname = projectname, K = K,
                   numchain = numchain, burnin = burnin, thin = thin, 
                   optK = optK, C = C)
config.i = 3
output.tree = canopy.output(post = post, config.i = config.i, C = C)



