library(s20x)


### Name: crossFactors
### Title: Crossed Factors
### Aliases: crossFactors crossFactors.default crossFactors.formula
### Keywords: models

### ** Examples


## arousal data:
data(arousal.df)
gender.picture = crossFactors(arousal.df$gender, arousal.df$picture)
gender.picture

## arousal data:
data(arousal.df)
gender.picture = crossFactors(~ gender * picture, data = arousal.df)
gender.picture





