library(unmarked)


### Name: pcountOpen
### Title: Fit the open N-mixture models of Dail and Madsen and extensions
### Aliases: pcountOpen
### Keywords: models

### ** Examples


## Simulation
## No covariates, constant time intervals between primary periods, and
## no secondary sampling periods

set.seed(3)
M <- 50
T <- 5
lambda <- 4
gamma <- 1.5
omega <- 0.8
p <- 0.7
y <- N <- matrix(NA, M, T)
S <- G <- matrix(NA, M, T-1)
N[,1] <- rpois(M, lambda)
for(t in 1:(T-1)) {
	S[,t] <- rbinom(M, N[,t], omega)
	G[,t] <- rpois(M, gamma)
	N[,t+1] <- S[,t] + G[,t]
	}
y[] <- rbinom(M*T, N, p)


# Prepare data
umf <- unmarkedFramePCO(y = y, numPrimary=T)
summary(umf)


# Fit model and backtransform
(m1 <- pcountOpen(~1, ~1, ~1, ~1, umf, K=20)) # Typically, K should be higher

(lam <- coef(backTransform(m1, "lambda"))) # or
lam <- exp(coef(m1, type="lambda"))
gam <- exp(coef(m1, type="gamma"))
om <- plogis(coef(m1, type="omega"))
p <- plogis(coef(m1, type="det"))

## Not run: 
##D # Finite sample inference. Abundance at site i, year t
##D re <- ranef(m1)
##D devAskNewPage(TRUE)
##D plot(re, layout=c(5,5), subset = site %in% 1:25 & year %in% 1:2,
##D      xlim=c(-1,15))
##D devAskNewPage(FALSE)
##D 
##D (N.hat1 <- colSums(bup(re)))
##D 
##D # Expected values of N[i,t]
##D N.hat2 <- matrix(NA, M, T)
##D N.hat2[,1] <- lam
##D for(t in 2:T) {
##D     N.hat2[,t] <- om*N.hat2[,t-1] + gam
##D     }
##D 
##D rbind(N=colSums(N), N.hat1=N.hat1, N.hat2=colSums(N.hat2))
##D 
##D 
## End(Not run)




