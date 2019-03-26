library(LCAvarsel)


### Name: LCAvarsel
### Title: Variable selection for latent class analysis
### Aliases: LCAvarsel print.LCAvarsel

### ** Examples

## Not run: 
##D # few simple examples
##D data(carcinoma, package = "poLCA")
##D sel1 <- LCAvarsel(carcinoma)                  # Fop et al. (2017) method with no swap step
##D sel2 <- LCAvarsel(carcinoma, swap = TRUE)     # Fop et al. (2017) method with swap step
##D sel3 <- LCAvarsel(carcinoma, search = "forward", 
##D                   independence = TRUE)        # Dean and Raftery(2010) method
##D sel4 <- LCAvarsel(carcinoma, search = "ga")   # stochastic evolutionary search
##D 
##D # an example with a concomitant covariate 
##D data(election, package = "poLCA")
##D elec <- election[, cbind("MORALG", "CARESG", "KNOWG", "LEADG", "DISHONG", "INTELG",
##D                          "MORALB", "CARESB", "KNOWB", "LEADB", "DISHONB", "INTELB")]
##D party <- election$PARTY
##D fit <- fitLCA(elec, G = 3, X = party)
##D sel <- LCAvarsel(elec, G = 3, X = party, parallel = TRUE)
##D pidmat <- cbind(1, 1:7)
##D exb1 <- exp(pidmat %*% fit$coeff)
##D exb2 <- exp(pidmat %*% sel$model$coeff)
##D par(mfrow = c(1,2))
##D matplot(1:7, ( cbind(1, exb1)/(1 + rowSums(exb1)) ),
##D         ylim = c(0,1), type = "l",
##D         main = "Party ID as a predictor of candidate affinity class",
##D         xlab = "Party ID: strong Democratic (1) to strong Republican (7)",
##D         ylab = "Probability of latent class membership", 
##D         lwd = 2 , col = 1)
##D matplot(1:7, ( cbind(1, exb2)/(1 + rowSums(exb2)) ),
##D         ylim = c(0,1), type = "l",
##D         main = "Party ID as a predictor of candidate affinity class",
##D         xlab = "Party ID: strong Democratic (1) to strong Republican (7)",
##D         ylab = "Probability of latent class membership", 
##D         lwd = 2 , col = 1)
##D # compare
##D compareCluster(fit$class, sel$model$class)
## End(Not run)



