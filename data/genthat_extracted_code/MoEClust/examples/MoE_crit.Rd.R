library(MoEClust)


### Name: MoE_crit
### Title: MoEClust BIC, ICL, and AIC Model-Selection Criteria
### Aliases: MoE_crit
### Keywords: clustering

### ** Examples

MoE_crit(modelName=c("VVI", "VVE", "VVV"), n=120, d=8,
         G=3, loglik=c(-4036.99, -3987.12, -3992.45))

data(CO2data)
GNP   <- CO2data$GNP
model <- MoE_clust(CO2data$CO2, G=1:2, expert= ~ GNP)
G     <- model$G
name  <- model$modelName
ll    <- max(model$loglik)
n     <- length(CO2data$CO2)
z     <- model$z

# Compare BIC from MoE_crit to the BIC of the model
(bic2 <- MoE_crit(modelName=name, loglik=ll, n=n, d=1, G=G, z=z,
                  expert.pen=G * length(coef(model$expert[[1]])))["bic",])
identical(bic2, unname(model$bic)) #TRUE

# Make the same comparison with the known number of estimated parameters
(bic3 <- MoE_crit(modelName=name, loglik=ll, n=n, G=G, df=model$df, z=z)["bic",])
identical(bic3, bic2)              #TRUE



