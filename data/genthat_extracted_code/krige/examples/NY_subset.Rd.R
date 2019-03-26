library(krige)


### Name: NY_subset
### Title: New York State CCES Respondents in 2008
### Aliases: NY_subset
### Keywords: datasets

### ** Examples

# Descriptive Statistics
summary(NY_subset)

# Simple Linear Model of Ideology as a Function of Race and Sex
simple.mod <- lm(ideology~as.factor(race)+female, data=NY_subset)
summary(simple.mod)



