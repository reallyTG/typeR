library(demography)


### Name: lifetable
### Title: Construct lifetables from mortality rates
### Aliases: lifetable
### Keywords: models

### ** Examples

france.lt <- lifetable(fr.mort)
plot(france.lt)
lt1990 <- print(lifetable(fr.mort,year=1990))

france.LC <- lca(fr.mort)
france.fcast <- forecast(france.LC)
france.lt.f <- lifetable(france.fcast)
plot(france.lt.f)

# Birth cohort lifetables, 1900-1910
france.clt <- lifetable(fr.mort,type="cohort",age=0, years=1900:1910)

# Partial cohort lifetables for 1950
lifetable(fr.mort,type="cohort",years=1950)




