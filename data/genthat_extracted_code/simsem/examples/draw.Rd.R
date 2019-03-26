library(simsem)


### Name: draw
### Title: Draw parameters from a 'SimSem' object.
### Aliases: draw

### ** Examples

loading <- matrix(0, 6, 2)
loading[1:3, 1] <- NA
loading[4:6, 2] <- NA
LY <- bind(loading, 0.7)

latent.cor <- matrix(NA, 2, 2)
diag(latent.cor) <- 1
RPS <- binds(latent.cor, 0.5)

RTE <- binds(diag(6))

VY <- bind(rep(NA,6),2)

CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType = "CFA")

# Draw a parameter set for data generation.
param <- draw(CFA.Model)

# Example of Multiple Group Model with Weak Invariance

loading.in <- matrix(0, 6, 2)
loading.in[1:3, 1] <- c("load1", "load2", "load3")
loading.in[4:6, 2] <- c("load4", "load5", "load6")
mis <- matrix(0,6,2)
mis[loading.in == "0"] <- "runif(1, -0.1, 0.1)"
LY.in <- bind(loading.in, "runif(1, 0.7, 0.8)", mis)

latent.cor <- matrix(NA, 2, 2)
diag(latent.cor) <- 1
RPS <- binds(latent.cor, 0.5)

RTE <- binds(diag(6))

VTE <- bind(rep(NA, 6), 0.51)

VPS1 <- bind(rep(1, 2))

VPS2 <- bind(rep(NA, 2), c(1.1, 1.2))

# Inequality constraint
script <- "
sth := load1 + load2 + load3
load4 == (load5 + load6) / 2
load4 > 0
load5 > 0
sth2 := load1 - load2
"

# Model Template
weak <- model(LY = LY.in, RPS = RPS, VPS=list(VPS1, VPS2), RTE = RTE, VTE=VTE, ngroups=2, 
     modelType = "CFA", con=script)

# Constraint --> Misspecification --> Fill Parameters
draw(weak, createOrder=c(1, 2, 3))

# Constraint --> Fill Parameters --> Misspecification 
draw(weak, createOrder=c(1, 3, 2))

# Misspecification --> Constraint --> Fill Parameters
draw(weak, createOrder=c(2, 1, 3))

# Misspecification --> Fill Parameters --> Constraint
draw(weak, createOrder=c(2, 3, 1))

# Fill Parameters --> Constraint --> Misspecification
draw(weak, createOrder=c(3, 1, 2))

# Fill Parameters --> Misspecification --> Constraint
draw(weak, createOrder=c(3, 2, 1))



