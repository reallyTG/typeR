library(simsem)


### Name: model.lavaan
### Title: Build the data generation template and analysis template from
###   the lavaan result
### Aliases: model.lavaan

### ** Examples

library(lavaan)
HS.model <- ' visual  =~ x1 + x2 + x3
             textual =~ x4 + x5 + x6
             speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data=HolzingerSwineford1939)

# Create data generation and data analysis model from lavaan
# Data generation is based on standardized parameters
datamodel1 <- model.lavaan(fit, std=TRUE)

# Data generation is based on unstandardized parameters
datamodel2 <- model.lavaan(fit, std=FALSE)

# Data generation model with misspecification on cross-loadings
crossload <- matrix("runif(1, -0.1, 0.1)", 9, 3)
crossload[1:3, 1] <- 0
crossload[4:6, 2] <- 0
crossload[7:9, 3] <- 0
datamodel3 <- model.lavaan(fit, std=TRUE, LY=crossload)



