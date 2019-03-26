library(demography)


### Name: life.expectancy
### Title: Estimate life expectancy from mortality rates
### Aliases: life.expectancy e0 flife.expectancy
### Keywords: models

### ** Examples

plot(life.expectancy(fr.mort),ylab="Life expectancy")

france.LC <- lca(fr.mort,adjust="e0",years=1950:1997)
france.fcast <- forecast(france.LC,jumpchoice="actual")
france.e0.f <- life.expectancy(france.fcast)

france.fdm <- fdm(extract.years(fr.mort,years=1950:2006))
france.fcast <- forecast(france.fdm)
## Not run: 
##D e0.fcast <- e0(france.fcast,PI=TRUE,nsim=200)
##D plot(e0.fcast)
## End(Not run)

life.expectancy(fr.mort,type='cohort',age=50)




