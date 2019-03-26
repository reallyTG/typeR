library(AquaEnv)


### Name: BufferFactors
### Title: BufferFactors
### Aliases: BufferFactors
### Keywords: misc

### ** Examples
## Not run: 
##D # Default run
##D BufferFactors()
##D 
##D # All carbonate system species
##D BufferFactors(species = c("CO2", "HCO3", "CO3"))
##D 
##D # Total concentrations of all species
##D BufferFactors(species = c("SumCO2", "SumNH4", "SumH3PO4", "SumHNO3",
##D                           "SumHNO2", "SumH2S", "SumSiOH4", "SumBOH3",
##D                           "SumHF", "SumH2SO4"))
##D 
##D # Different carbonate system equilibrium constants
##D BufferFactors(k1k2 = "roy")
##D 
##D # Object of class 'aquaenv' as input
##D ae_input <- aquaenv(S=35, t=25, SumCO2 = 0.0020, pH = 8.1,
##D                     skeleton = TRUE)
##D BufferFactors(ae = ae_input)
##D 
##D # Produces some NaNs as certain total concentrations are zero
##D BufferFactors(ae = ae_input, 
##D               species = c("SumCO2", "SumNH4", "SumH3PO4", "SumHNO3",
##D                           "SumHNO2", "SumH2S", "SumSiOH4", "SumBOH3",
##D                           "SumHF", "SumH2SO4"))
##D 
##D # Object of class 'aquaenv' as input, but different total alkalinity
##D parameters <- c(Alk = 0.0022)
##D BufferFactors(ae = ae_input, parameters = parameters)
##D 
## End(Not run)


