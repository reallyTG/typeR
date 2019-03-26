library(adaptsmoFMRI)


### Name: sim.fmri
### Title: Simulate FMRI Data
### Aliases: sim.fmri

### ** Examples

# non-transformed hr-function
T <- 210
seq.length <- T*3
index <- seq(3, T*3, by = 3)
hrf <- rep(c(-0.5, 0.5), each=30, times=ceiling(T/30*1.5))
hrf <- as.matrix(hrf[index])
# define height of activation area
beta <- 3
# use function to obtain fmri data
data <- sim.fmri(hrf, beta)$fmri



