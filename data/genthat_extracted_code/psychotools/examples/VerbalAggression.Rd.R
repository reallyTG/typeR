library(psychotools)


### Name: VerbalAggression
### Title: Situation-Response Questionnaire on Verbal Aggression
### Aliases: VerbalAggression
### Keywords: datasets

### ** Examples

data("VerbalAggression", package = "psychotools")

## Rasch model for the self-to-blame situations
m <- raschmodel(VerbalAggression$resp2[, 1:12])
summary(m)
plot(m)



