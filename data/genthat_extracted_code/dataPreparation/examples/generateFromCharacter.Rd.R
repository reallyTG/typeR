library(dataPreparation)


### Name: generateFromCharacter
### Title: Recode character
### Aliases: generateFromCharacter

### ** Examples

# Load data set
data(messy_adult)
messy_adult <- unFactor(messy_adult, verbose = FALSE) # un factor ugly factors

# transform column "mail"
messy_adult <- generateFromCharacter(messy_adult, cols = "mail")
head(messy_adult)

# To transform all characters columns:
messy_adult <- generateFromCharacter(messy_adult, cols = "auto")



