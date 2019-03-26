library(dataPreparation)


### Name: generateFromFactor
### Title: Recode factor
### Aliases: generateFromFactor

### ** Examples

# Load data set
data(messy_adult)

# transform column "type_employer"
messy_adult <- generateFromFactor(messy_adult, cols = "type_employer")
head(messy_adult)

# To transform all factor columns:
messy_adult <- generateFromFactor(messy_adult, cols = "auto")



