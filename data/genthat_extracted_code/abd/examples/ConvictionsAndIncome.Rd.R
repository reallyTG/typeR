library(abd)


### Name: ConvictionsAndIncome
### Title: Convictions and Income Level in a Cohort of English Boys
### Aliases: ConvictionsAndIncome
### Keywords: datasets

### ** Examples

str(ConvictionsAndIncome)
ConvictionsAndIncome

xtabs(~ convicted + income, data = ConvictionsAndIncome)



