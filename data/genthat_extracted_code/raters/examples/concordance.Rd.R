library(raters)


### Name: concordance
### Title: Inter-rater agreement among a set of raters for nominal data
### Aliases: concordance
### Keywords: datasets

### ** Examples

data(diagnostic)
concordance(diagnostic,test="Chisq")
concordance(diagnostic,test="Normal")
concordance(diagnostic,test="MC",B=100)



