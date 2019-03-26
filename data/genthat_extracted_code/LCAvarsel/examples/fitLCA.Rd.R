library(LCAvarsel)


### Name: fitLCA
### Title: Latent class analysis model
### Aliases: fitLCA print.fitLCA

### ** Examples

data(gss82, package = "poLCA")
maxG(gss82, 1:7)      # not all latent class models can be fitted
fit <- fitLCA(gss82, G = 1:4)

## Not run: 
##D # diminish tolerance and increase number of replicates
##D fit2 <- fitLCA(gss82, G = 1:4, ctrlLCA = controlLCA(tol = 1e-06, nrep = 10))
## End(Not run)

# the example with a single covariate as in ?poLCA
data(election, package = "poLCA")
elec <- election[, cbind("MORALG", "CARESG", "KNOWG", "LEADG", "DISHONG", "INTELG",
                         "MORALB", "CARESB", "KNOWB", "LEADB", "DISHONB", "INTELB")]
party <- election$PARTY
fit <- fitLCA(elec, G = 3, X = party)
pidmat <- cbind(1, 1:7)
exb <- exp(pidmat %*% fit$coeff)
matplot(1:7, ( cbind(1, exb)/(1 + rowSums(exb)) ),
        ylim = c(0,1), type = "l",
        main = "Party ID as a predictor of candidate affinity class",
        xlab = "Party ID: strong Democratic (1) to strong Republican (7)",
        ylab = "Probability of latent class membership", 
        lwd = 2 , col = 1)



