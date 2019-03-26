library(PSM)


### Name: PSM.simulate
### Title: Create simulation data for multiple individuals
### Aliases: PSM.simulate
### Keywords: htest models multivariate ts

### ** Examples

#specify pharmacokinetic model
#2 state equations, 1 observation equation, 1 random effect

mod = vector(mode="list")
mod$Matrices = function(phi) {
  list(
    matA=matrix(c(-phi$ka, 0, phi$ka, -phi$ke), nrow=2, ncol=2, byrow=TRUE),
    matC=matrix(c(0, 1), nrow=1, ncol=2)
  )
}
mod$h = function(eta, theta, covar) {
  phi = theta
  phi$dose = theta$dose * exp(eta[1])
  phi
}
mod$S = function(phi) {
  matrix(c(phi$sigma), nrow=1, ncol=1)
}
mod$SIG = function(phi) {
  matrix(c(0, 0, 0, phi$omega), nrow=2, ncol=2, byrow=TRUE)
}
mod$X0 = function(Time, phi, U) {
  matrix(c(phi$dose, 0), nrow=2, ncol=1)
}
mod$ModelPar = function(THETA) {
  list(theta=list(dose = THETA["dose"], ka = THETA["ka"], ke = THETA["ke"],
                  omega = THETA["omega"], sigma = THETA["sigma"]),
       OMEGA=matrix(c(THETA["BSV_dose"]), nrow=1, ncol=1)
  )
}


#specify sampling scheme and RNG

TheophPSM <- list()
TheophPSM[[1]] <- list(Time = seq(0,25,5))
set.seed(12345)

#simulate and visualize ODE model (no volatility)

parM <- c(ka = 1.58, ke = 0.08, dose = 9.54, omega = 0, sigma = 1.05, BSV_dose = 0)
TheophSim <- PSM.simulate(mod, TheophPSM, THETA = parM, deltaTime = 0.1)
plot(TheophSim[[1]]$longTime, TheophSim[[1]]$longX[2,],
     type="l", ylab="concentration", xlab="time")

#contrast it to SDE model

parM <- c(ka = 1.58, ke = 0.08, dose = 9.54, omega = 0.34, sigma = 1.05, BSV_dose = 0)
TheophSim <- PSM.simulate(mod, TheophPSM, THETA = parM, deltaTime = 0.1)
lines(TheophSim[[1]]$longTime, TheophSim[[1]]$longX[2,],
     ylab="concentration", xlab="time")



