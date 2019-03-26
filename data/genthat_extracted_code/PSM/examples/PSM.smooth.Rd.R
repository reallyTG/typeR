library(PSM)


### Name: PSM.smooth
### Title: Smoothing of model states based on estimated population
###   parameters.
### Aliases: PSM.smooth
### Keywords: htest models multivariate ts

### ** Examples

#detailed examples are provided in the package vignette

#Theophylline data from Boeckmann et al (1994)
#objective: recover the administered doses

library(datasets)
data(Theoph) 


#reshape data to PSM format

TheophPSM = list()
for(i in 1:length(unique(Theoph$Subject))){
  TheophPSM[[i]] = with(
    Theoph[Theoph$Subject == i,],
    list(Y = matrix(conc, nrow=1), Time = Time)
  )
}


#specify a simple pharmacokinetic model comprised of
#2 state equations and 1 observation equation
#initial value of 1 state eq. varies randomly across individuals

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


#specify the search space of the fitting algorithm

parM = c(ka = 1.5, ke = 0.1, dose = 10, omega = .3, sigma = 1,
         BSV_dose = 0.015)
pars = list(LB=parM*.25, Init=parM, UB=parM*1.75)

#fit model and predict data

fit = PSM.estimate(mod, TheophPSM, pars, trace = 1, fast = TRUE,
  control=list(optimizer="optim", maxit=1))
pred = PSM.smooth(mod, TheophPSM, fit$THETA)

#visualize recovery performance

true_dose = tapply(Theoph$conc, Theoph$Subject, mean)
true_dose = true_dose[order(as.numeric(names(true_dose)))]
est_dose = fit$THETA["dose"] * exp(unlist(lapply(pred, function(x) x$eta)))
plot(true_dose, est_dose,
  xlab="actually administered dose", ylab= "recovered dose")
abline(lm(est_dose ~ true_dose), lty=2)



