library(nlirms)


### Name: rmspfc
### Title: Rate-making system based on the posteriori freuency component
### Aliases: rmspfc rmspfc

### ** Examples

# rate-Making system based on the Poisson-Gamma model for frequency component
rmspfc(time = 5, claim = 5, fmu = .2, fsigma = 2, fnu = 1, family = "PGA", round
= 2, size = 8, padlength = 4, padwidth = 2)

# rate-Making system based on the Poisson-Inverse Gamma model for frequency component
rmspfc(time = 5, claim = 5, fmu = .2, fsigma = 2, fnu = 1, family = "PIGA",
round = 2, size = 8, padlength = 4, padwidth = 2)

# rate-Making system based on the Poisson-Generalized Inverse Gaussian model for frequency
rmspfc(time = 5, claim = 5, fmu = .2, fsigma = 2, fnu = 1, family = "PGIG",
round = 2, size = 8, padlength = 4, padwidth = 2)



