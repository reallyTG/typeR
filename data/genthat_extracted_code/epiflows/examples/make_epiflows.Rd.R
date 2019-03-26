library(epiflows)


### Name: make_epiflows
### Title: Create an epiflows object
### Aliases: make_epiflows make_epiflows.data.frame make_epiflows.integer
###   make_epiflows.numeric

### ** Examples

## Load data
data(YF_flows)
data(YF_locations)
YF_flows
YF_locations
## Use both to create the epiflows object.
ef <- make_epiflows(flows         = YF_flows, 
                    locations     = YF_locations, 
                    pop_size      = "location_population",
                    duration_stay = "length_of_stay",
                    num_cases     = "num_cases_time_window",
                    first_date    = "first_date_cases",
                    last_date     = "last_date_cases"
                   )
ef
# Access variable information
get_pop_size(ef)
get_vars(ef, "duration_stay")
get_vars(ef, "num_cases")
data(YF_Brazil)
(inflows   <- YF_Brazil$T_O["Espirito Santo", , drop = TRUE])
(outflows  <- YF_Brazil$T_D["Espirito Santo", , drop = TRUE])
(locations <- subset(YF_Brazil$states, location_code == "Espirito Santo", drop = FALSE))
los <- data.frame(location_code    = names(YF_Brazil$length_of_stay), 
                  length_of_stay   = YF_Brazil$length_of_stay,
                  stringsAsFactors = FALSE
                 )
locations <- merge(x   = locations, 
                   y   = los, 
                   by  = "location_code", 
                   all = TRUE)
ef <- make_epiflows(inflow = inflows, 
                    outflow = outflows, 
                    focus = "Espirito Santo", 
                    locations = locations,
                    pop_size = "location_population",
                    duration_stay = "length_of_stay",
                    num_cases = "num_cases_time_window",
                    first_date = "first_date_cases",
                    last_date = "last_date_cases"
                   )
ef



