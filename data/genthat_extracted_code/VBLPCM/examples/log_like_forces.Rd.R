library(VBLPCM)


### Name: log_like_forces
### Title: create an initial configuration for the latent positions.
### Aliases: log_like_forces

### ** Examples

data(sampson)
N=network.size(samplike)
X=matrix(runif(N*2,-2,2),ncol=2)
XX=vblpcmcovs(N,"plain",as.sociomatrix(samplike))
out<-log_like_forces(samplike, 2, X, 0, m=N, 1e3)
plot(samplike,coord=out$X)



