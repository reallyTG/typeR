library(eRm)


### Name: itemfit.ppar
### Title: Residuals, Personfit and Itemfit Statistics
### Aliases: itemfit.ppar itemfit personfit.ppar personfit residuals.ppar
###   pmat.ppar pmat print.ifit print.pfit print.resid
### Keywords: models

### ** Examples


# Rasch model, estimation of item and person parameters
res <- RM(raschdat2)
p.res <- person.parameter(res)

# Matrix with expected probabilities and corresponding residuals
pmat(p.res)
residuals(p.res)

#Itemfit
itemfit(p.res)

#Personfit
personfit(p.res)




