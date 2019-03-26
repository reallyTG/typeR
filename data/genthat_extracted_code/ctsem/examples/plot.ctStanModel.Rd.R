library(ctsem)


### Name: plot.ctStanModel
### Title: Prior plotting
### Aliases: plot.ctStanModel

### ** Examples

model <- ctModel(type='omx', Tpoints=50,
n.latent=2, n.manifest=1, 
manifestNames='sunspots', 
latentNames=c('ss_level', 'ss_velocity'),
LAMBDA=matrix(c( 1, 'ma1' ), nrow=1, ncol=2),
DRIFT=matrix(c(0, 1,   'a21', 'a22'), nrow=2, ncol=2, byrow=TRUE),
MANIFESTMEANS=matrix(c('m1'), nrow=1, ncol=1),
# MANIFESTVAR=matrix(0, nrow=1, ncol=1),
CINT=matrix(c(0, 0), nrow=2, ncol=1),
DIFFUSION=matrix(c(
  0, 0,
  0, "diffusion"), ncol=2, nrow=2, byrow=TRUE))

stanmodel=ctStanModel(model)
plot(stanmodel,rows=8)



