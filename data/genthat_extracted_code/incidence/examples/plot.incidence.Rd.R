library(incidence)


### Name: plot.incidence
### Title: Plot function for incidence objects
### Aliases: plot.incidence add_incidence_fit plot.incidence_fit
###   plot.incidence_fit_list

### ** Examples


if(require(outbreaks) && require(ggplot2)) { withAutoprint({
  onset <- ebola_sim$linelist$date_of_onset

  ## daily incidence
  inc <- incidence(onset)
  inc
  plot(inc)

  ## weekly incidence
  inc.week <- incidence(onset, interval = 7)
  inc.week
  plot(inc.week) # default to label x axis tick marks with isoweeks
  plot(inc.week, labels_iso = FALSE) # label x axis tick marks with dates
  plot(inc.week, border = "white") # with visible border

  ## use group information
  sex <- ebola_sim$linelist$gender
  inc.week.gender <- incidence(onset, interval = 7, groups = sex)
  plot(inc.week.gender)
  plot(inc.week.gender, labels_iso = FALSE)

  ## show individual cases at the beginning of the epidemic
  inc.week.8 <- subset(inc.week.gender, to = "2014-06-01")
  plot(inc.week.8, show_cases = TRUE, border = "black")

  ## customize plot with ggplot2
  plot(inc.week.8, show_cases = TRUE, border = "black") +
    theme_classic(base_size = 16) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

  ## adding fit
  fit <- fit_optim_split(inc.week.gender)$fit
  plot(inc.week.gender, fit = fit)
  plot(inc.week.gender, fit = fit, labels_iso = FALSE)
})}




