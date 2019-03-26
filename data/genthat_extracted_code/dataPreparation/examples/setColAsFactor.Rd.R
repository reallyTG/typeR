library(dataPreparation)


### Name: setColAsFactor
### Title: Set columns as factor
### Aliases: setColAsFactor

### ** Examples

# Load messy_adult
data("messy_adult")

# we wil change education
messy_adult <- setColAsFactor(messy_adult, cols = "education")

sapply(messy_adult[, .(education)], class)
# education is now a factor



