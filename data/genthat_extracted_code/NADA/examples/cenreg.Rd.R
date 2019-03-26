library(NADA)


### Name: cenreg
### Title: Compute regression equations and likelihood correlation
###   coefficient for censored data.
### Aliases: cenreg
### Keywords: survival

### ** Examples



    # (examples in Chap 12 of the NADA book)
    data(TCEReg)

    # Using the formula interface
    with(TCEReg, cenreg(Cen(TCEConc, TCECen)~PopDensity))

    # Two or more explanatory variables requires the formula interface
    tcemle2 = with(TCEReg, cenreg(Cen(TCEConc, TCECen)~PopDensity+Depth))

    # Prediction of quantiles at PopDensity=5 and Depth=110
    predict(tcemle2, c(5, 110))



