library(biogas)


### Name: vol2mol
### Title: Calculate Moles of a Gas
### Aliases: vol2mol
### Keywords: manip

### ** Examples

# Assume we have measured 253 mL CH4 at 1.0 atm and 22 C, dry
vol2mol(253, "CH4", temp = 22, pres = 1)

# Compare to results to NIST values for the least ideal gas
# Results are within 0.5%
# Expect 0.04108 mol
vol2mol(1000, "CO2", temp = 25, pres = 1)

# Expect 0.08258 mol
vol2mol(1000, "CO2", temp = 25, pres = 2)

# Expect 0.07482 mol
vol2mol(1000, "CO2", temp = 55, pres = 2)



