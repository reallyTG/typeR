library(mixtox)


### Name: gcaHill
### Title: Mixture Toxicity Prediction Using GCA (Hill_two)
### Aliases: gcaHill
### Keywords: generalized concentration addition Hill_two equal effect
###   concentration ratio uniform design concentration ratio arbitrary
###   concentration ratio uniform design table

### ** Examples

model <- c("Hill_two", "Hill_two", "Hill_two", "Hill_two")
param <- matrix(c(3.94e-5, 0.97, 0, 5.16e-4, 1.50, 0, 3.43e-6, 1.04, 0, 9.18e-6, 0.77, 0), 
				nrow = 4, ncol = 3, byrow = TRUE)
rownames(param) <- c('Ni', 'Zn', 'Cu', 'Mn')
colnames(param) <- c('Alpha', 'Beta', 'Gamma')
## example 1
# using GCA to predict the mixtures designed by equal effect concentration ratio (eecr) at
# the effect concentration of EC05 and EC50
# the eecr mixture design is based on four heavy metals (four factors).
gcaHill(model, param, mixType = "eecr", effv = c(0.05, 0.5), rtype = 'continuous')

## example 2
# using GCA to predict the mixtures designed by uniform design concentration ratio (udcr)
# the udcr mixture design is based on four heavy metals (four factors).
# Seven levels (EC05, EC10, EC15, EC20, EC25, EC30, and EC50 ) are allocated in 
# the uniform table
effv <- c(0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.50)
gcaHill(model, param, mixType = "udcr", effv, rtype = 'quantal')

## example 3
# using GCA to predict the mixtures designed by arbitrary concentration ratio (acr)
# the udcr mixture design is based on four heavy metals (four factors).
# the every component in the mixture shares exactly the same ratio (0.25) 
effv <- c(0.25, 0.25, 0.25, 0.25)
gcaHill(model, param, mixType = "acr", effv)



