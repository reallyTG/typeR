library(nparMD)


### Name: nparms
### Title: Nonparametric Test For Multivariate Data With Two-Way Layout
###   Factorial Design - Small Samples
### Aliases: nparms

### ** Examples

data(pseudostudy2)
nparms(resp1|resp2|resp3~treatment*age, pseudostudy2)



