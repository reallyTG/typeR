library(CLME)


### Name: minque
### Title: MINQUE Algorithm
### Aliases: minque

### ** Examples

data( rat.blood )

model_mats <- model_terms_clme( mcv ~ time + temp + sex + (1|id) , 
                                data = rat.blood )
Y  <- model_mats$Y
X1 <- model_mats$X1
X2 <- model_mats$X2
U  <- model_mats$U

# No covariates or random effects
minque(Y = Y, X1 = X1 )

# Include covariates and random effects
minque(Y = Y, X1 = X1, X2 = X2, U = U )




