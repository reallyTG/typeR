library(nadiv)


### Name: prepPed
### Title: Prepares a pedigree by sorting and adding 'founders'
### Aliases: prepPed

### ** Examples



# First create an unordered pedigree with (4) missing founders
  warcolak_unsuitable <- warcolak[sample(seq(5, nrow(warcolak), 1),
	size = (nrow(warcolak) - 4), replace = FALSE), ]
  nrow(warcolak)
  nrow(warcolak_unsuitable)
# Fix and sort the pedigree
## Automatically assign the correct gender to the added founders
### Also sort the data accompanying each individual
  warcolak_fixed_ordered <- prepPed(warcolak_unsuitable, gender = "sex")
  head(warcolak_fixed_ordered)




