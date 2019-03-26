library(krige)


### Name: NYcity_subset
### Title: New York City CCES Respondents in 2008
### Aliases: NYcity_subset
### Keywords: datasets

### ** Examples

# Descriptive Statistics
summary(NYcity_subset)

# Simple Linear Model of Ideology as a Function of Race and Sex
simple.mod <- lm(ideology~as.factor(race)+female, data=NYcity_subset)
summary(simple.mod)



