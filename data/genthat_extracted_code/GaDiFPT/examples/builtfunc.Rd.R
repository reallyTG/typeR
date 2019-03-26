library(GaDiFPT)


### Name: builtfunc
### Title: Functions characterizing the Gaussian Diffusion process X(t) and
###   the considered threshold
### Aliases: builtfunc a b cc S Sp a1 a2 mdt vdt fdt psi

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.


delta <- 0.5
time.vec <- seq(0, by=delta, 100)

# linear threshold
Scost <- 6
Sslope <- 0.2
# user provided function (see examples in demo folder)
SSS <- function(t) {
  SSS <- Scost + Sslope*t
}
Slin <- S(time.vec)
plot(time.vec,Slin,type='l',xlab='time',ylab='threshold',main='linear threshold')

# periodic threshold
S0 <- 0
S1 <- 2
Sfr <- 0.5 
# user provided function (see examples in demo folder)
SSS <- function(t) {
  SSS <- S1*cos(Sfr*t+S0)
}
Sper <- S(time.vec)
plot(time.vec,Sper,type='l',xlab='time',ylab='threshold',main='periodic threshold')



