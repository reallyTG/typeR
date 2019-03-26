library(ems)


### Name: calcurve
### Title: Calibration Curve
### Aliases: calcurve print.calcurve plot.calcurve

### ** Examples



# Loading the dataset
data(icu)

# Calibration Curve Plot
a <- calcurve(deaths = icu$UnitDischargeName,
pred = icu$Saps3DeathProbabilityStandardEquation,
score = icu$Saps3Points, name_score = 'Saps3',
categories_option = 'score', table = FALSE, plot = TRUE)





