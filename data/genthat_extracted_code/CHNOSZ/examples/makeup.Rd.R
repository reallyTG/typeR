library(CHNOSZ)


### Name: makeup
### Title: Parse Chemical Formulas
### Aliases: makeup count.elements

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
# the composition of a simple compound
makeup("CO2")     # 1 carbon, 2 oxygen
# the formula of lawsonite, with a parenthetical part and a suffix
makeup("CaAl2Si2O7(OH)2*H2O")
# fractional coefficients are ok
redfield <- c(106, 16, 1)
reddiv10 <- makeup("C10.6N1.6P0.1")
stopifnot(10*reddiv10 == redfield)

# the coefficient for charge is a number with a *preceding* sign
# e.g., ferric iron, with a charge of +3 is expressed as
makeup("Fe+3")
# transcribing the formula the way it appears in many 
# publications produces a likely unintended result:
# 3 iron atoms and a charge of +1
makeup("Fe3+")

# these all represent a single negative charge, i.e., electron
makeup("-1")
makeup("Z-1+0")
makeup("Z0-1")   # the "old" formula for the electron in thermo$obigt
makeup("(Z-1)")  # the current formula in thermo$obigt

# hypothetical compounds with negative numbers of elements
makeup("C-4(O-2)")   # -4 carbon, -2 oxygen
makeup("C-4O-2")     # -4 carbon,  1 oxygen, -2 charge
makeup("C-4O-2-2")   # -4 carbon, -2 oxygen, -2 charge

# the 'sum' argument can be used to check mass and charge
# balance in a chemical reaction
formula <- c("H2O", "H+", "(Z-1)", "O2")
(mf <- makeup(formula, c(-1, 2, 2, 0.5), sum=TRUE))
stopifnot(all(mf==0))



