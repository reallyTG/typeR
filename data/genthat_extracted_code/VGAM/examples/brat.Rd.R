library(VGAM)


### Name: brat
### Title: Bradley Terry Model
### Aliases: brat
### Keywords: models regression

### ** Examples

# Citation statistics: being cited is a 'win'; citing is a 'loss'
journal <- c("Biometrika", "Comm.Statist", "JASA", "JRSS-B")
mat <- matrix(c( NA, 33, 320, 284,
                730, NA, 813, 276,
                498, 68,  NA, 325,
                221, 17, 142,  NA), 4, 4)
dimnames(mat) <- list(winner = journal, loser = journal)
fit <- vglm(Brat(mat) ~ 1, brat(refgp = 1), trace = TRUE)
fit <- vglm(Brat(mat) ~ 1, brat(refgp = 1), trace = TRUE, crit = "coef")
summary(fit)
c(0, coef(fit))  # Log-abilities (in order of "journal")
c(1, Coef(fit))  # Abilities (in order of "journal")
fitted(fit)     # Probabilities of winning in awkward form
(check <- InverseBrat(fitted(fit)))  # Probabilities of winning
check + t(check)  # Should be 1's in the off-diagonals



