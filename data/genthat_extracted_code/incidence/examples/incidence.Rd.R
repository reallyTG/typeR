library(incidence)


### Name: incidence
### Title: Compute incidence of events from a vector of dates.
### Aliases: incidence incidence.default incidence.Date incidence.character
###   incidence.integer incidence.numeric incidence.POSIXt print.incidence

### ** Examples

## toy example
incidence(c(1, 5, 8, 3, 7, 2, 4, 6, 9, 2))
incidence(c(1, 5, 8, 3, 7, 2, 4, 6, 9, 2), 2)

## example using simulated dataset
if(require(outbreaks)) { withAutoprint({
  onset <- ebola_sim$linelist$date_of_onset

  ## daily incidence
  inc <- incidence(onset)
  inc
  plot(inc)

  ## weekly incidence
  inc.week <- incidence(onset, interval = 7, standard = FALSE)
  inc.week
  plot(inc.week)
  plot(inc.week, border = "white") # with visible border
  inc.isoweek <- incidence(onset, interval = 7, standard = TRUE)
  inc.isoweek
  ## use group information
  sex <- ebola_sim$linelist$gender
  inc.week.gender <- incidence(onset, interval = 7,
                               groups = sex, standard = FALSE)
  inc.week.gender
  head(inc.week.gender$counts)
  plot(inc.week.gender)
  inc.isoweek.gender <- incidence(onset, interval = 7,
                                  groups = sex, standard = TRUE)
  inc.isoweek.gender
})}





