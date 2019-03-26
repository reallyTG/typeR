library(adaptsmoFMRI)


### Name: sim.fmri2COVAR
### Title: Simulate FMRI Data
### Aliases: sim.fmri2COVAR

### ** Examples

# non-transformed hr-function
T <- 180
seq.length <- T*3
index <- seq(3, T*3, by = 3)
vis <- rep(c(-0.5, 0.5), each=30, times=ceiling(T/30*1.5))
vis <- as.matrix(vis[index])
aud <- rep(c(-0.5, 0.5), each=45, times=ceiling(T/30*1.5))
aud <- as.matrix(aud[index])
hrf <- cbind(vis,aud)
# define height of activation area
beta.Var1 <- beta.Var2 <- 3
# use function to obtain fmri data
data <- sim.fmri2COVAR(hrf, beta.Var1, beta.Var2)$fmri



