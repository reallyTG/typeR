library(fluxweb)


### Name: sensitivity
### Title: sensitivity analysis
### Aliases: sensitivity

### ** Examples


# first compute species per unit biomass metabolic rates using the metabolic theory:
losses = 0.1 * species.level$bodymasses^(-0.25)


res = sensitivity(fluxing, "mat", 0.1, 5, full.output = TRUE, 
                 mat = species.level$mat, 
                 biomasses = species.level$biomasses, 
                 losses = losses, 
                 efficiencies = species.level$efficiencies)
res = sensitivity(fluxing, "efficiencies", 0.01, 50, 
                 mat = species.level$mat, 
                 biomasses = species.level$biomasses, 
                 losses = losses, 
                 efficiencies = species.level$efficiencies)

# growth rates of basal species
growth.rates = rep(NA, dim(species.level$mat)[1])
growth.rates[colSums(species.level$mat) == 0] = 0.5

val.mat = fluxing(species.level$mat, species.level$biomasses, losses, species.level$efficiencies)






