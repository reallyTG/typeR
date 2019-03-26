library(FME)


### Name: collin
### Title: Estimates the Collinearity of Parameter Sets
### Aliases: collin plot.collin print.collin
### Keywords: utilities

### ** Examples

## =======================================================================
## Test collinearity values
## =======================================================================

## linearly related set...  => Infinity
collin(cbind(1:5, 2*(1:5)))

## unrelated set            => 1
MM <- matrix(nr = 4, nc = 2, byrow = TRUE,
  data = c(-0.400, -0.374, 0.255, 0.797, 0.690, -0.472, -0.546,  0.049))

collin(MM)

## =======================================================================
## Bacterial model as in Soetaert and Herman, 2009
## =======================================================================

pars <- list(gmax = 0.5,eff = 0.5,
             ks = 0.5, rB = 0.01, dB = 0.01)

solveBact <- function(pars) {
  derivs <- function(t, state, pars) {   # returns rate of change
    with (as.list(c(state, pars)), {
      dBact <-  gmax*eff*Sub/(Sub + ks)*Bact - dB*Bact - rB*Bact
      dSub  <- -gmax    *Sub/(Sub + ks)*Bact + dB*Bact
      return(list(c(dBact, dSub)))
    })
  }
  state   <- c(Bact = 0.1, Sub = 100)
  tout    <- seq(0, 50, by = 0.5)
  ## ode solves the model by integration...
  return(as.data.frame(ode(y = state, times = tout, func = derivs,
    parms = pars)))
}

out <- solveBact(pars)

## We wish to estimate parameters gmax and eff by fitting the model to
## these data:
Data <- matrix(nc = 2, byrow = TRUE, data =
  c(  2,  0.14,  4,  0.2,    6,  0.38,  8,  0.42,
     10,  0.6,  12,  0.107, 14,  1.3,  16,  2.0,
     18,  3.0,  20,  4.5,   22,  6.15, 24,  11,
     26, 13.8,  28, 20.0,   30,  31 ,  35, 65, 40, 61)
)
colnames(Data) <- c("time","Bact")
head(Data)

Data2 <- matrix(c(2, 100, 20, 93, 30, 55, 50, 0), ncol = 2, byrow = TRUE)
colnames(Data2) <- c("time", "Sub")


## Objective function to minimise
Objective <- function (x) {                  # Model cost
 pars[] <- x
 out   <- solveBact(x)
 Cost  <- modCost(obs = Data2, model = out)  # observed data in 2 data.frames
 return(modCost(obs = Data, model = out, cost = Cost))
}

## 1. Estimate sensitivity functions - all parameters
sF <- sensFun(func = Objective, parms = pars, varscale = 1)

## 2. Estimate the collinearity
Coll <- collin(sF)

## The larger the collinearity, the less identifiable the data set
Coll

plot(Coll, log = "y")

## 20 = magical number above which there are identifiability problems
abline(h = 20, col = "red")

## select "identifiable" sets with 4 parameters
Coll [Coll[,"collinearity"] < 20 & Coll[,"N"]==4,]

## collinearity of one selected parameter set
collin(sF, c(1, 3, 5))
collin(sF, 1:5)

collin(sF, c("gmax", "eff"))
## collinearity of all combinations of 3 parameters
collin(sF, N = 3)

## The collinearity depends on the value of the parameters:
P      <- pars
P[1:2] <- 1  # was: 0.5
collin(sensFun(Objective, P, varscale = 1))




