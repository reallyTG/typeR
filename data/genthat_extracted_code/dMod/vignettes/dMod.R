## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.width = 10, fig.height = 8, warning = FALSE, message = FALSE)

## ------------------------------------------------------------------------
library(dMod)
library(dplyr)
set.seed(2)

## ------------------------------------------------------------------------
# Generate the ODE model
r <- eqnlist() %>% 
  addReaction("STAT"       , "pSTAT"      , "p1*pEpoR*STAT" , "STAT phosphoyrl.") %>%
  addReaction("2*pSTAT"    , "pSTATdimer" , "p2*pSTAT^2"    , "pSTAT dimerization") %>%
  addReaction("pSTATdimer" , "npSTATdimer", "p3*pSTATdimer" , "pSTAT dimer import") %>%
  addReaction("npSTATdimer", "2*nSTAT"    , "p4*npSTATdimer", "dimer dissociation") %>%
  addReaction("nSTAT"      , "STAT"       , "p5*nSTAT"      , "nuclear export")

print(r)

## ------------------------------------------------------------------------
# Parameterize the receptor phosphorylation
receptor <- "((1 - exp(-time*lambda1))*exp(-time*lambda2))^3"
r$rates <- r$rates %>% 
  insert("pEpoR ~ pEpoR*rec", rec = receptor)


## ------------------------------------------------------------------------
# Generate odemodel
model0 <- odemodel(r, modelname = "jakstat", compile = TRUE)

## ---- fig.width = 6, fig.height = 4--------------------------------------
# Generate a prediction function
x <- Xs(model0)

# Make a prediction based on random parameter values
parameters <- getParameters(x)
pars <- structure(runif(length(parameters), 0, 1), names = parameters)
times <- seq(0, 10, len = 100)
prediction <- x(times, pars)
plot(prediction)


## ------------------------------------------------------------------------
# Define observables like total STAT, total phosphorylated STAT, etc.
observables <- eqnvec(
  tSTAT = "s_tSTAT*(STAT + pSTAT + 2*pSTATdimer)",
  tpSTAT = "s_tpSTAT*(pSTAT + 2*pSTATdimer) + off_tpSTAT",
  pEpoR = paste0("s_EpoR * pEpoR *", receptor)
)

# Define the observation function. Information about states and dynamic parameters
# is contained in reactions
g <- Y(observables, r, modelname = "obsfn", compile = TRUE, attach.input = FALSE)

## ---- fig.width = 6, fig.height = 2.5------------------------------------
# Make a prediction of the observables based on random parameter values
parameters <- getParameters(x, g)
pars <- structure(runif(length(parameters), 0, 1), names = parameters)
times <- seq(0, 10, len = 100)
prediction <- (g*x)(times, pars)
plot(prediction)

## ------------------------------------------------------------------------

p <- eqnvec() %>% 
  # Start with the identity transformation
  define("x~x", x = getParameters(x, g)) %>% 
  # Fix some initial values
  define("x~0", x = c("pSTAT", "pSTATdimer", "npSTATdimer", "nSTAT")) %>% 
  # Log-transform all current symbols found in the equations
  insert("x~exp(x)", x = .currentSymbols) %>% 
  # Generate parameter transformation function
  P(condition = "Epo")

print(getEquations(p))



## ------------------------------------------------------------------------

# Add another parameter transformation
p <- p +
  # Start with the current transformation
  getEquations(p, conditions = "Epo") %>%
  # Insert multiple of pEpoR everywhere where we finde pEpoR
  define("pEpoR ~ multiple*exp(pEpoR)") %>% 
  # Generate parameter transformation function with another condition name
  P(condition = "Epo prediction")

print(getEquations(p))


## ---- fig.width = 6, fig.height = 2.5------------------------------------
# Make a prediction of the observables based on random parameter values
parameters <- getParameters(p)
pars <- structure(runif(length(parameters), 0, 1), names = parameters)
pars["multiple"] <- 2
times <- seq(0, 10, len = 100)
prediction <- (g*x*p)(times, pars)
plot(prediction)

## ---- fig.width = 6, fig.height = 2--------------------------------------
data(jakstat)
data <- as.datalist(jakstat, split.by = "condition")
plot(data)

## ------------------------------------------------------------------------
obj <- normL2(data, g*x*p)

## ------------------------------------------------------------------------
mu <- structure(rep(0, length(parameters) - 1), names = setdiff(parameters, "multiple"))
fixed <- c(multiple = 2)
constr <- constraintL2(mu = mu, sigma = 5)

## ---- fig.width = 6, fig.height = 2--------------------------------------

myfit <- trust(obj + constr, mu, rinit = 1, rmax = 10, fixed = fixed)
times <- 0:60
plot((g*x*p)(times, myfit$argument, fixed = fixed), data)


## ---- fig.width = 5, fig.height = 4--------------------------------------

fitlist <- mstrust(obj + constr, 
                   center = myfit$argument, 
                   fits = 20, 
                   cores = 1, 
                   sd = 2, 
                   fixed = fixed, conditions = "Epo")

pars <- as.parframe(fitlist)
plotValues(pars, tol = .1)
plotPars(pars, tol = .1)


## ---- fig.width = 10, fig.height = 3.5-----------------------------------

controls(g, NULL, "attach.input") <- TRUE
prediction <- predict(g*x*p, 
                      times = 0:60, 
                      pars = unique(pars[pars$converged, ], tol = .1), 
                      data = data, 
                      fixed = c(multiple = 2))

library(ggplot2)
ggplot(prediction, aes(x = time, y = value, color = .value, group = .value)) +
  facet_grid(condition~name, scales = "free") +
  geom_line() + 
  geom_point(data = attr(prediction, "data")) +
  theme_dMod()



## ---- fig.width = 4, fig.height = 3--------------------------------------

myprofile <- profile(obj + constr, pars = myfit$argument, whichPar = "s_EpoR", fixed = fixed)
plotProfile(myprofile)


## ---- fig.width = 6, fig.height = 5--------------------------------------

plotPaths(myprofile)


## ---- fig.width = 4, fig.height = 3--------------------------------------

fixed <- c(p1 = 0, pEpoR = 0, multiple = 2) # log values
pars <- mu[setdiff(names(mu), names(fixed))]
myfit <- trust(obj + constr, pars, rinit = 1, rmax = 10, fixed = fixed)
myprofile <- profile(obj + constr, pars = myfit$argument, whichPar = "s_EpoR", fixed = fixed)

plotProfile(myprofile)


