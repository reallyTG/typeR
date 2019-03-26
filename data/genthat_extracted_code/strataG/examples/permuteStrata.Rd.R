library(strataG)


### Name: permuteStrata
### Title: Permute strata
### Aliases: permuteStrata

### ** Examples

data(msats.g)
msats.g <- stratify(msats.g, "fine")
summary(msats.g)

ran.msats <- permuteStrata(msats.g)
summary(ran.msats)




