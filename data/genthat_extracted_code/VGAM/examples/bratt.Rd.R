library(VGAM)


### Name: bratt
### Title: Bradley Terry Model With Ties
### Aliases: bratt
### Keywords: models regression

### ** Examples

# citation statistics: being cited is a 'win'; citing is a 'loss'
journal <- c("Biometrika", "Comm.Statist", "JASA", "JRSS-B")
mat <- matrix(c( NA, 33, 320, 284,
                730, NA, 813, 276,
                498, 68,  NA, 325,
                221, 17, 142,  NA), 4, 4)
dimnames(mat) <- list(winner = journal, loser = journal)

# Add some ties. This is fictitional data.
ties <- 5 + 0 * mat
ties[2, 1] <- ties[1,2] <- 9

# Now fit the model
fit <- vglm(Brat(mat, ties) ~ 1, bratt(refgp = 1), trace = TRUE)
fit <- vglm(Brat(mat, ties) ~ 1, bratt(refgp = 1), trace = TRUE, crit = "coef")

summary(fit)
c(0, coef(fit))  # Log-abilities (in order of "journal"); last is log(alpha0)
c(1, Coef(fit))  #     Abilities (in order of "journal"); last is alpha0

fit@misc$alpha   # alpha_1,...,alpha_M
fit@misc$alpha0  # alpha_0

fitted(fit)  # Probabilities of winning and tying, in awkward form
predict(fit)
(check <- InverseBrat(fitted(fit)))    # Probabilities of winning
qprob <- attr(fitted(fit), "probtie")  # Probabilities of a tie
qprobmat <- InverseBrat(c(qprob), NCo = nrow(ties))  # Probabilities of a tie
check + t(check) + qprobmat  # Should be 1s in the off-diagonals



