## ------------------------------------------------------------------------
rm(list = ls())
library(PBD)

## ------------------------------------------------------------------------
library(ape)

## ------------------------------------------------------------------------
seed <- 43
set.seed(seed)
b_1 <- 0.3 # speciation-initiation rate of good species
la_1 <- 0.2 # speciation-completion rate
b_2 <- b_1 # the speciation-initiation rate of incipient species
mu_1 <- 0.1 #  extinction rate of good species
mu_2 <- mu_1 # extinction rate of incipient species 
pars <- c(b_1, la_1, b_2, mu_1, mu_2)
age <- 15 # the age for the simulation 
phylogenies <- pbd_sim(pars = pars, age = age)
plot(phylogenies$recontree)
plot(phylogenies$igtree.extant)
plot(phylogenies$tree)
names(phylogenies)


## ------------------------------------------------------------------------
brts <- branching.times(phylogenies$recontree)  # branching times
init_b <- 0.2  # speciation-initiation rate
init_mu_1 <- 0.05  # extinction rate of good species
init_la_1 <- 0.3 # speciation-completion rate
#init_mu_2 <- 0.05  # extinction rate of incipient species  # not used

# The initial values of the parameters that must be optimized
initparsopt <- c(init_b, init_mu_1, init_la_1)

# The extinction rates between incipient and good species are equal
exteq <- TRUE

# The first element of the branching times is the crown age (and not the stem age)
soc <- 2

# Conditioning on non-extinction of the phylogeny
# as I actively selected for a nice phylogeny
cond <- 1

# Give the likelihood of the phylogeny (instead of the likelihood of the branching times)
btorph <- 1

## ------------------------------------------------------------------------
r <- pbd_ML(
  brts = brts,
  initparsopt = initparsopt, 
  exteq = exteq,
  soc = soc, 
  cond = cond,
  btorph = btorph,
  verbose = FALSE
)

## ------------------------------------------------------------------------
knitr::kable(r)

## ------------------------------------------------------------------------
loglik_true <- PBD::pbd_loglik(pars, brts = brts)
df <- as.data.frame(r)
df <- rbind(df, c(b_1, mu_1, la_1, mu_2, loglik_true, NA, NA))
row.names(df) <- c("ML", "true")
knitr::kable(df)

## ------------------------------------------------------------------------

endmc <- 10 # Sets the number of simulations for the bootstrap

b <- pbd_bootstrap(
  brts = brts,
  initparsopt = initparsopt, 
  exteq = exteq,
  soc = soc, 
  cond = cond,
  btorph = btorph,
  plotltt = FALSE,
  endmc = endmc,
  seed = seed
)
knitr::kable(b[[3]])

## ------------------------------------------------------------------------
dg <- rbind(df, 
  list(
    b = b[[1]]$b, 
    mu_1 = b[[1]]$mu_1, 
    lambda_1 = b[[1]]$lambda_1, 
    mu_2 = b[[1]]$mu_2,
    loglik = b[[1]]$loglik,
    df = b[[1]]$df,
    conv = b[[1]]$conv
  ),
  list(
    b = b[[3]]$b, 
    mu_1 = b[[3]]$mu_1, 
    lambda_1 = b[[3]]$lambda_1, 
    mu_2 = b[[3]]$mu_2,
    loglik = b[[3]]$loglik,
    df = b[[3]]$df,
    conv = b[[3]]$conv
  )
)
dg

row.names(dg) <- c("ML", "true", "ML2", paste("BS", 1:endmc, sep = ""))
knitr::kable(dg)

## ------------------------------------------------------------------------
ml_b <- b[[1]]$b
ml_mu_1 <- b[[1]]$mu_1
ml_la_1 <- b[[1]]$lambda_1
ml_mu_2 <- b[[1]]$mu_2
ml_pars1 <- c(ml_b, ml_mu_1, ml_la_1, ml_mu_2)
ml_pars2 <- c(cond, btorph, soc, 0, "lsoda")

l <- pbd_loglik(
  pars1 = ml_pars1,
  pars2 = ml_pars2,
  brts = brts
)
print(l)

