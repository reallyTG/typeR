library(fluxweb)


### Name: fluxing
### Title: generate fluxes
### Aliases: fluxing

### ** Examples

# first compute species per unit biomass metabolic rates using the metabolic theory:
losses = 0.1 * species.level$bodymasses^(-0.25)

# call of the function:
fluxing(species.level$mat, 
       species.level$biomasses, 
       losses, 
       species.level$efficiencies, 
       bioms.pref = TRUE, 
       ef.level = "prey")




