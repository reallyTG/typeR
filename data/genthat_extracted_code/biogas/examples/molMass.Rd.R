library(biogas)


### Name: molMass
### Title: Calculate Molar Mass of Compound
### Aliases: molMass

### ** Examples

  molMass("C6H12O6")

  molMass("CH3COOH")

  molMass("CH3CH2OH")

  molMass("CH4")

  molMass("ch4")

  molMass(c("C6H12O6", "CH3COOH", "CH3CH2OH"))

  # Case-sentitive for two letter elements
  molMass("NaHCO3")

  # Complex formulas OK
  molMass("H3C(CH2)5COOH")

  molMass("(C6H12O6)0.24999 (H3COOH)0.75001")

  # Database is quite complete 
  molMass('CdSiO3')

  # Use care for, e.g., hydrates
  molMass('FeSO4(H2O)7')




