library(incidence)


### Name: fit
### Title: Fit exponential models to incidence data
### Aliases: fit fit_optim_split print.incidence_fit
###   print.incidence_fit_list

### ** Examples


if (require(outbreaks)) { withAutoprint({
 dat <- ebola_sim$linelist$date_of_onset

 ## EXAMPLE WITH A SINGLE MODEL

 ## compute weekly incidence
 i.7 <- incidence(dat, interval=7)
 plot(i.7)
 plot(i.7[1:20])

 ## fit a model on the first 20 weeks
 f <- fit(i.7[1:20])
 f
 names(f)
 head(get_info(f, "pred"))

 ## plot model alone (not recommended)
 plot(f)

 ## plot data and model (recommended)
 plot(i.7, fit = f)
 plot(i.7[1:25], fit = f)

## piping versions
if (require(magrittr)) { withAutoprint({
  plot(i.7) %>% add_incidence_fit(f)


  ## EXAMPLE WITH 2 PHASES
  ## specifying the peak manually
  f2 <- fit(i.7, split = as.Date("2014-10-15"))
  f2
  plot(i.7) %>% add_incidence_fit(f2)

  ## finding the best 'peak' date
  f3 <- fit_optim_split(i.7)
  f3
  plot(i.7) %>% add_incidence_fit(f3$fit)
})}

})}




