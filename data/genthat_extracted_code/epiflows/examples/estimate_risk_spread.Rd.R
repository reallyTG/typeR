library(epiflows)


### Name: estimate_risk_spread
### Title: Travel-related disease cases spreaded to other locations from an
###   infectious location
### Aliases: estimate_risk_spread estimate_risk_spread.default
###   estimate_risk_spread.epiflows

### ** Examples

## Using an epiflows object --------------------------------

data("YF_flows")
data("YF_locations")
ef <- make_epiflows(flows         = YF_flows, 
                    locations     = YF_locations, 
                    pop_size      = "location_population",
                    duration_stay = "length_of_stay",
                    num_cases     = "num_cases_time_window",
                    first_date    = "first_date_cases",
                    last_date     = "last_date_cases"
)
## functions generating incubation and infectious periods
incubation <- function(n) {
  rlnorm(n, 1.46, 0.35)
}

infectious <- function(n) {
  rnorm(n, 4.5, 1.5/1.96)
}

res <- estimate_risk_spread(ef, 
                            location_code          = "Espirito Santo",
                            r_incubation           = incubation,
                            r_infectious           = infectious,
                            n_sim                  = 1e5,
                            return_all_simulations = TRUE)
boxplot(res, las = 3)

## Using other data --------------------------------------------------
data(YF_Brazil)
indstate <- 1 # "Espirito Santo" (indstate = 1), 
              # "Minas Gerais" (indstate = 2), 
              # "Southeast Brazil" (indstate = 5)

res <- estimate_risk_spread(
  location_code = YF_Brazil$states$location_code[indstate], 
  location_population = YF_Brazil$states$location_population[indstate], 
  num_cases_time_window = YF_Brazil$states$num_cases_time_window[indstate], 
  first_date_cases = YF_Brazil$states$first_date_cases[indstate], 
  last_date_cases = YF_Brazil$states$last_date_cases[indstate],
  num_travellers_to_other_locations = YF_Brazil$T_D[indstate,],
  num_travellers_from_other_locations = YF_Brazil$T_O[indstate,],
  avg_length_stay_days = YF_Brazil$length_of_stay,
  r_incubation = incubation,
  r_infectious = infectious,
  n_sim = 100000,
  return_all_simulations = FALSE
)
head(res)




