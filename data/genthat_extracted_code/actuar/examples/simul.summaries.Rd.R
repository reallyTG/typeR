library(actuar)


### Name: simul.summaries
### Title: Summary Statistics of a Portfolio
### Aliases: simul.summaries rcomphierarc.summaries aggregate.portfolio
###   frequency.portfolio severity.portfolio weights.portfolio
### Keywords: models methods

### ** Examples

nodes <- list(sector = 3, unit = c(3, 4),
              employer = c(3, 4, 3, 4, 2, 3, 4), year = 5)
model.freq <- expression(sector = rexp(1),
                         unit = rexp(sector),
                         employer = rgamma(unit, 1),
                         year = rpois(employer))
model.sev <- expression(sector = rnorm(6, 0.1),
                        unit = rnorm(sector, 1),
                        employer = rnorm(unit, 1),
                        year = rlnorm(employer, 1))
pf <- simul(nodes, model.freq, model.sev)

aggregate(pf)            # aggregate claim amount by employer and year
aggregate(pf, classification = FALSE) # same, without node identifiers
aggregate(pf, by = "sector")	      # by sector
aggregate(pf, by = "y")		      # by year
aggregate(pf, by = c("s", "u"), mean) # average claim amount

frequency(pf)			      # number of claims
frequency(pf, prefix = "freq.")       # more explicit column names

severity(pf)			      # claim amounts by row
severity(pf, by = "year")	      # by column
severity(pf, by = c("s", "u"))        # by unit
severity(pf, splitcol = "year.5")     # last year separate
severity(pf, splitcol = 5)            # same
severity(pf, splitcol = c(FALSE, FALSE, FALSE, FALSE, TRUE)) # same

weights(pf)

## For portfolios with weights, the following computes loss ratios.
## Not run: aggregate(pf, classif = FALSE) / weights(pf, classif = FALSE)



