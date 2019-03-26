library(ape)


### Name: corphylo
### Title: Correlations among Multiple Traits with Phylogenetic Signal
### Aliases: corphylo print.corphylo
### Keywords: regression

### ** Examples

## Simple example using data without correlations or phylogenetic
## signal. This illustrates the structure of the input data.

phy <- rcoal(10, tip.label = 1:10)
X <- matrix(rnorm(20), nrow = 10, ncol = 2)
rownames(X) <- phy$tip.label
U <- list(NULL, matrix(rnorm(10, mean = 10, sd = 4), nrow = 10, ncol = 1))
rownames(U[[2]]) <- phy$tip.label
SeM <- matrix(c(0.2, 0.4), nrow = 10, ncol = 2)
rownames(SeM) <- phy$tip.label

corphylo(X = X, SeM = SeM, U = U, phy = phy, method = "Nelder-Mead")

## Not run: 
##D ## Simulation example for the correlation between two variables. The
##D ## example compares the estimates of the correlation coefficients from
##D ## corphylo when measurement error is incorporated into the analyses with
##D ## three other cases: (i) when measurement error is excluded, (ii) when
##D ## phylogenetic signal is ignored (assuming a "star" phylogeny), and (iii)
##D ## neither measurement error nor phylogenetic signal are included.
##D 
##D ## In the simulations, variable 2 is associated with a single
##D ## independent variable. This requires setting up a list U that has 2
##D ## elements: element U[[1]] is NULL and element U[[2]] is a n x 1 vector
##D ## containing simulated values of the independent variable.
##D 
##D # Set up parameter values for simulating data
##D n <- 50
##D phy <- rcoal(n, tip.label = 1:n)
##D 
##D R <- matrix(c(1, 0.7, 0.7, 1), nrow = 2, ncol = 2)
##D d <- c(0.3, .95)
##D B2 <- 1
##D 
##D Se <- c(0.2, 1)
##D SeM <- matrix(Se, nrow = n, ncol = 2, byrow = T)
##D rownames(SeM) <- phy$tip.label
##D 
##D # Set up needed matrices for the simulations
##D p <- length(d)
##D 
##D star <- stree(n)
##D star$edge.length <- array(1, dim = c(n, 1))
##D star$tip.label <- phy$tip.label
##D 
##D Vphy <- vcv(phy)
##D Vphy <- Vphy/max(Vphy)
##D Vphy <- Vphy/exp(determinant(Vphy)$modulus[1]/n)
##D 
##D tau <- matrix(1, nrow = n, ncol = 1) ##D 
##D C <- matrix(0, nrow = p * n, ncol = p * n)
##D for (i in 1:p) for (j in 1:p) {
##D 	Cd <- (d[i]^tau * (d[j]^t(tau)) * (1 - (d[i] * d[j])^Vphy))/(1 - d[i] * d[j])
##D 	C[(n * (i - 1) + 1):(i * n), (n * (j - 1) + 1):(j * n)] <- R[i, j] * Cd
##D }
##D MM <- matrix(SeM^2, ncol = 1)
##D V <- C + diag(as.numeric(MM))
##D 
##D ## Perform a Cholesky decomposition of Vphy. This is used to generate
##D ## phylogenetic signal: a vector of independent normal random variables,
##D ## when multiplied by the transpose of the Cholesky deposition of Vphy will
##D ## have covariance matrix equal to Vphy.
##D iD <- t(chol(V))
##D 
##D # Perform Nrep simulations and collect the results
##D Nrep <- 100
##D cor.list <- matrix(0, nrow = Nrep, ncol = 1)
##D cor.noM.list <- matrix(0, nrow = Nrep, ncol = 1)
##D cor.noP.list <- matrix(0, nrow = Nrep, ncol = 1)
##D cor.noMP.list <- matrix(0, nrow = Nrep, ncol = 1)
##D d.list <- matrix(0, nrow = Nrep, ncol = 2)
##D d.noM.list <- matrix(0, nrow = Nrep, ncol = 2)
##D B.list <- matrix(0, nrow = Nrep, ncol = 3)
##D B.noM.list <- matrix(0, nrow = Nrep, ncol = 3)
##D B.noP.list <- matrix(0, nrow = Nrep, ncol = 3)
##D for (rep in 1:Nrep) {
##D 	XX <- iD ##D 
##D 	X <- matrix(XX, nrow = n, ncol = 2)
##D 	rownames(X) <- phy$tip.label
##D 
##D 	U <- list(NULL, matrix(rnorm(n, mean = 2, sd = 10), nrow = n, ncol = 1))
##D 	rownames(U[[2]]) <- phy$tip.label
##D 	colnames(U[[2]]) <- "V1"
##D 	X[,2] <- X[,2] + B2[1] * U[[2]][,1] - B2[1] * mean(U[[2]][,1])
##D 
##D 	z <- corphylo(X = X, SeM = SeM, U = U, phy = phy, method = "Nelder-Mead")
##D 	z.noM <- corphylo(X = X, U = U, phy = phy, method = "Nelder-Mead")
##D 	z.noP <- corphylo(X = X, SeM = SeM, U = U, phy = star, method = "Nelder-Mead")
##D 
##D 	cor.list[rep] <- z$cor.matrix[1, 2]
##D 	cor.noM.list[rep] <- z.noM$cor.matrix[1, 2]
##D 	cor.noP.list[rep] <- z.noP$cor.matrix[1, 2]
##D 	cor.noMP.list[rep] <- cor(cbind(lm(X[,1] ~ 1)$residuals, lm(X[,2] ~ U[[2]])$residuals))[1,2]
##D 
##D 	d.list[rep, ] <- z$d
##D 	d.noM.list[rep, ] <- z.noM$d
##D 
##D 	B.list[rep, ] <- z$B
##D 	B.noM.list[rep, ] <- z.noM$B
##D 	B.noP.list[rep, ] <- z.noP$B
##D 
##D 	show(c(rep, z$convcode, z$cor.matrix[1, 2], z$d))
##D }
##D correlation <- rbind(R[1, 2], mean(cor.list), mean(cor.noM.list),
##D                      mean(cor.noP.list), mean(cor.noMP.list))
##D rownames(correlation) <- c("True", "With SeM and Phy", "Without SeM",
##D                            "Without Phy", "Without Phy or SeM")
##D correlation
##D 
##D signal.d <- rbind(d, colMeans(d.list), colMeans(d.noM.list))
##D rownames(signal.d) <- c("True", "With SeM and Phy", "Without SeM")
##D signal.d
##D 
##D est.B <- rbind(c(0, 0, B2), colMeans(B.list), colMeans(B.noM.list),
##D                colMeans(B.noP.list))
##D rownames(est.B) <- c("True", "With SeM and Phy", "Without SeM", "Without Phy")
##D colnames(est.B) <- rownames(z$B)
##D est.B
##D 
##D # Example simulation output
##D # correlation
##D                         # [,1]
##D # True               0.7000000
##D # With SeM and Phy   0.7055958
##D # Without SeM        0.3125253
##D # Without Phy        0.4054043
##D # Without Phy or SeM 0.3476589
##D 
##D # signal.d
##D                      # [,1]      [,2]
##D # True             0.300000 0.9500000
##D # With SeM and Phy 0.301513 0.9276663
##D # Without SeM      0.241319 0.4872675
##D 
##D # est.B
##D                         # B1.0      B2.0     B2.V1
##D # True              0.00000000 0.0000000 1.0000000
##D # With SeM and Phy -0.01285834 0.2807215 0.9963163
##D # Without SeM       0.01406953 0.3059110 0.9977796
##D # Without Phy       0.02139281 0.3165731 0.9942140
## End(Not run)


