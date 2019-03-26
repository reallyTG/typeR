library(qmethod)


### Name: qfsi
### Title: Q Methodology: Factor Stability index
### Aliases: qfsi
### Keywords: Q methodology

### ** Examples

data(lipset)
boots <- qmboots(lipset[[1]], nfactors=3, nsteps=10, 
           rotation="varimax", indet="qindtest",
           fsi=FALSE)
fsi <- qfsi(nfactors=3, nstat=33, qscores=boots[[6]], 
           zsc_bn=boots[[1]][[1]], qm=boots[[5]])
fsi



