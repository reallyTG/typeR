library(mvmeta)


### Name: mvmetaSim
### Title: Simulating Responses for mvmeta Models
### Aliases: mvmetaSim simulate.mvmeta
### Keywords: models regression multivariate methods

### ** Examples

# RUN A MODEL
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98)

# SIMULATE A NEW SET OF OUTCOMES
simulate(model)

# SIMULATE FROM SCRATCH: 3 OUTCOMES, 8 STUDIES
(y <- matrix(0,8,3))
(S <- inputcov(matrix(runif(8*3,0.1,2),8,3,dimnames=list(NULL,
  c("V1","V2","V3"))),cor=c(0,0.5,0.7)))
(Psi <- inputcov(1:3,cor=0.3))
mvmetaSim(y,S,Psi)

# ALTERNATIVELY, DEFINE Psi THROUGH STANDARD DEVIATIONS AND CORRELATION 0.2
mvmetaSim(y,S,sd=1:3,cor=0.3)

# 2 SIMULATION SETS
mvmetaSim(y,S,Psi,nsim=2)



