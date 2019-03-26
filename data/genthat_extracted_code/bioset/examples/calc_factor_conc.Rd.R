library(bioset)


### Name: calc_factor_conc
### Title: Get a factor to convert concentrations.
### Aliases: calc_factor_conc

### ** Examples

library("dplyr")

# generate test data
data <- tibble(
  sample = c("A", "B", "C"),
  conc = c(4.5, 2.3, 5.1),       # concentration in g  / l
)

fctr_ng_ml <- calc_factor_conc(from = "g/l", to = "ng/ml")
# give molar mass in g / mol
fctr_mol_l <- calc_factor_conc(from = "g/l", to = "M", molar_mass = 78.971)
# give densities in g / l
fctr_pc <- calc_factor_conc(from = "g/l", to = "%v/v", density_solute = 4810)

data %>%
  mutate(
    conc_ng_ml = conc * fctr_ng_ml,
    conc_mol_l = conc * fctr_mol_l,
    conc_pc = conc * fctr_pc
)

# throws an error
## Not run: 
##D # will throw an error because molar_mass is missing
##D fctr_fail <- calc_factor_conc(from = "g/l", to = "mol/l")
## End(Not run)



