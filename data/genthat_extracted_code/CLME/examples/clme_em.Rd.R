library(CLME)


### Name: clme_em_fixed
### Title: Constrained EM algorithm for linear fixed or mixed effects
###   models.
### Aliases: clme_em_fixed clme_em_mixed clme_em

### ** Examples

data( rat.blood )

model_mats <- model_terms_clme( mcv ~ time + temp + sex + (1|id), data = rat.blood )

Y  <- model_mats$Y
X1 <- model_mats$X1
X2 <- model_mats$X2
U  <- model_mats$U

cons <- list(order = "simple", decreasing = FALSE, node = 1 )

clme.out <- clme_em(Y = Y, X1 = X1, X2 = X2, U = U, constraints = cons)




