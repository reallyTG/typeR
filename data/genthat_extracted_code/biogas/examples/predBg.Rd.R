library(biogas)


### Name: predBg
### Title: Predict Biogas Production
### Aliases: predBg

### ** Examples

  # BMP of cellulose in mL CH4/g
  predBg("C6H10O5")

  # How much is produced in a real reactor? Assume 10% goes to 
  # biomass production
  predBg("C6H10O5", fs = 0.1)

  # And substrate is 80% degradable
  predBg("C6H10O5", fs = 0.1, fd = 0.8)

  # More detailed results
  predBg("C6H10O5", value = "all")

  # Given a substrate with a COD of 1.4 g
  predBg(COD = 1.4)

  # But CH4 production is reduced if substrate is 80% degradable 
  # and 10% goes to cell synthesis
  predBg(COD = 1.4, fd = 0.8, fs = 0.1)

  # Can use macromolecule composition, e.g., for pig manure
  predBg(mcomp = c(vfa = 0.2, protein = 0.25, carbohydrate = 0.32, 
                   lipid = 0.15, lignin = 0.08), 
         value = "all")

  # Function expects sum(mcomp) == 1 but this is not required
  # But unless mass is set, mass is taken as sum(mcomp)
  predBg(mcomp = c(vfa = 20, protein = 25, carbohydrate = 32, 
                   lipid = 15, lignin = 8), 
         value = "all")

  # Specify mass if this is not the case
  predBg(mcomp = c(vfa = 20, protein = 25, carbohydrate = 32, 
                   lipid = 15, lignin = 8), 
         mass = 1, value = "all")

  # Can mix formulas and macromolecular groups in mcomp
  predBg(mcomp = c(C6H12O6 = 0.5, protein = 0.5))

  # For CO2 partitioning, must provide conc.sub, pH, and temp 
  # cattle manure example from Hafner (2007)
  predBg("C13H20O11N", mass = 1, fs = 0.1, fd = 0.56, 
         conc.sub = 85, pH = 7.7, temp = 35, value = "all")

  # Or, mix of waste paper and waste vegetable oil from vignette
  predBg(mcomp = c(C6H10O5 = 5/6, C54H100O7 = 1/6), mass = 1, 
	 fd = 0.8, fs = 0.1, conc.sub = 50, pH = 7.5, temp = 35, 
	 value = "all")

  # Note that form can also be used for mixtures, but here it is 
  # molar ratios that are specified
  predBg('(C6H10O5)5(C54H100O7)1)', mass = 1, 
	 fd = 0.8, fs = 0.1, conc.sub = 50, pH = 7.5, temp = 35, 
	 value = "all")
  
  # Function is vectorized for everything except mcomp, e.g., 
  # fs
  predBg("C6H10O5", fs = c(0, 0.05, 0.1), value = "all")

  # form
  predBg(c("C6H10O5", "C10H19O3N", "CH3CH2OH"), value = "all")
  
  # pH
  predBg("C13H20O11N", conc.sub = 85, fs = 0.1, fd = 0.56, 
         pH = 7+0:10/10, temp = 35, value = "all")



