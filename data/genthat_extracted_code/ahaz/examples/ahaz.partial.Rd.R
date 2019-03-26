library(ahaz)


### Name: ahaz.partial
### Title: Partial calculation of estimating quantities used by ahaz
### Aliases: ahaz.partial
### Keywords: methods

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,3:ncol(sorlie)])

# Get D for the first 10 covariates only
a<-ahaz.partial(surv,X,idx=1:10)
pD1 <- a$D

# Equivalent to the (slower) solution
b <- ahaz(surv,X)
pD2 <- b$D[1:10,]
max(abs(pD1-pD2))




