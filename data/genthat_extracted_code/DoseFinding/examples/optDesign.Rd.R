library(DoseFinding)


### Name: optDesign
### Title: Function to calculate optimal designs
### Aliases: optDesign plot.DRdesign calcCrit rndDesign

### ** Examples

## calculate designs for Emax model
doses <- c(0, 10, 100)
emodel <- Mods(emax = 15, doses=doses, placEff = 0, maxEff = 1)
optDesign(emodel, probs = 1)
## TD-optimal design
optDesign(emodel, probs = 1, designCrit = "TD", Delta=0.5)
## 50-50 mixture of Dopt and TD
optDesign(emodel, probs = 1, designCrit = "Dopt&TD", Delta=0.5)
## use dose levels different from the ones specified in emodel object
des <- optDesign(emodel, probs = 1, doses = c(0, 5, 20, 100))
## plot models overlaid by design 
plot(des, emodel)
## round des to a sample size of exactly 90 patients
rndDesign(des, n=90) ## using the round function would lead to 91 patients

## illustrating different optimizers (see Note above for more comparison)
optDesign(emodel, probs=1, optimizer="Nelder-Mead")
optDesign(emodel, probs=1, optimizer="nlminb")
## optimizer solnp (the default) can deal with lower and upper bounds:
optDesign(emodel, probs=1, designCrit = "TD", Delta=0.5,
          optimizer="solnp", lowbnd = rep(0.2,3))
## exact design using enumeration of all possibilites
optDesign(emodel, probs=1, optimizer="exact", n = 30)
## also allows to fix minimum groupSize
optDesign(emodel, probs=1, designCrit = "TD", Delta=0.5,
          optimizer="exact", n = 30,  control = list(groupSize=5))


## optimal design at interim analysis
## assume there are already 10 patients on each dose and there are 30
## left to randomize, this calculates the optimal increment design
optDesign(emodel, 1, designCrit = "TD", Delta=0.5,
          nold = c(10, 10, 10), n=30)

## use a larger candidate model set
doses <- c(0, 10, 25, 50, 100, 150)
fmods <- Mods(linear = NULL, emax = 25, exponential = 85,
             linlog = NULL, logistic = c(50, 10.8811),
             doses = doses, addArgs=list(off=1),
             placEff=0, maxEff=0.4)
probs <- rep(1/5, 5) # assume uniform prior
desDopt <- optDesign(fmods, probs, optimizer = "nlminb")
desTD <- optDesign(fmods, probs, designCrit = "TD", Delta = 0.2,
                   optimizer = "nlminb")
desMix <- optDesign(fmods, probs, designCrit = "Dopt&TD", Delta = 0.2)
## plot design and truth
plot(desMix, fmods)

## illustrate calcCrit function
## calculate optimal design for beta model
doses <- c(0, 0.49, 25.2, 108.07, 150)
models <- Mods(betaMod = c(0.33, 2.31), doses=doses,
                addArgs=list(scal=200),
                placEff=0, maxEff=0.4)
probs <- 1
deswgts <- optDesign(models, probs, designCrit = "Dopt",
                     control=list(maxit=1000))
## now compare this design to equal allocations on
## 0, 10, 25, 50, 100, 150
doses2 <- c(0, 10, 25, 50, 100, 150)
design2 <- c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)
crit2 <- calcCrit(design2, models, probs, doses2, designCrit = "Dopt")
## ratio of determinants (returned criterion value is on log scale)
exp(deswgts$crit-crit2)

## example for calculating an optimal design for logistic regression
doses <- c(0, 0.35, 0.5, 0.65, 1)
fMod <- Mods(linear = NULL, doses=doses, placEff=-5, maxEff = 10)
## now calculate weights to use in the covariance matrix
mu <- as.numeric(getResp(fMod, doses=doses))
mu <- 1/(1+exp(-mu))
weights <- mu*(1-mu) 
des <- optDesign(fMod, 1, doses, weights = weights) 

## one can also specify a user defined criterion function
## here D-optimality for cubic polynomial
CubeCrit <- function(w, doses){
  X <- cbind(1, doses, doses^2, doses^3)
  CVinv <- crossprod(X*w)
  -log(det(CVinv))
}
optDesign(doses = c(0,0.05,0.2,0.6,1),
          designCrit = "userCrit", userCrit = CubeCrit,
          optimizer = "nlminb")



