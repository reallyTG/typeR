library(marelac)


### Name: redfield
### Title: Redfield Ratio Calculator
### Aliases: redfield
### Keywords: misc

### ** Examples

## Redfield ratio
redfield(1, "P")
## returns the molar Redfield ratio, rescaled to nitrogen
redfield(1, "N")
## how many mass units are related to 2 mass units (e.g. mg) P
redfield(2, "P", "mass")
redfield(c(1, 2, 3), "N", "mass")

## mass percentage of elements
x <- redfield(1, "P", "mass")
x / sum(x)

## with alternative elemental composition (Stumm, 1964)
x <- redfield(1, "P", "mass", 
              ratio = c(C = 106, H = 180, O = 45, N = 16, P = 1))
x / sum(x)

## rule of thumb for fresh mass (in mg) formed by 1 microgram P
redfield(1, "P", "mass")$C * 2 * 10 / 1000
sum(redfield(1, "P", "mass",
  ratio = c(C = 106, H = 180, O = 45, N = 16, P = 1))) * 10 / 1000




