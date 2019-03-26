library(bioset)


### Name: convert_conc
### Title: Convert a value of the given concentration into another
###   concentration.
### Aliases: convert_conc

### ** Examples

library("dplyr")

# generate test data
data <- tibble(
  sample = c("A", "B", "C"),
  conc = c(4.5, 2.3, 5.1),       # concentration in g  / l
)

data %>%
  mutate(
    conc_ng_ml = convert_conc(x = conc, from = "g/l", to = "ng/ml"),
    # give molar mass in g / mol
    conc_mol_l = convert_conc(
      x = conc, from = "g/l", to = "M", molar_mass = 78.971),
    # give densities in g / l
    conc_pc = convert_conc(
      x = conc, from = "g/l", to = "%v/v", density_solute = 4810)
)

# throws an error
## Not run: 
##D # will throw an error because molar_mass is missing
##D fail <- convert_conc(x = 5, from = "g/l", to = "mol/l")
## End(Not run)




