library(epiflows)


### Name: global_vars
### Title: Epiflow Global Variables
### Aliases: global_vars epiflows.vars

### ** Examples


# see the default varaibles
global_vars()

# Equivalent
getOption("epiflows.vars")

# create an object, specifying these variables
data("YF_locations")
data("YF_flows")
ef <- make_epiflows(flows         = YF_flows, 
                    locations     = YF_locations, 
                    pop_size      = "location_population",
                    duration_stay = "length_of_stay",
                    num_cases     = "num_cases_time_window",
                    first_date    = "first_date_cases",
                    last_date     = "last_date_cases"
                   )
ef

## No test: 
# You will receive an error if a variable is specified incorrectly
YF_locations$random_variable <- runif(nrow(YF_locations))
try({
  ef <- make_epiflows(flows         = YF_flows, 
                      locations     = YF_locations, 
                      Pop_size      = "location_population",
                      duration_stay = "length_of_stay",
                      num_cases     = "num_cases_time_window",
                      first_date    = "first_date_cases",
                      last_date     = "last_date_cases",
                      random        = "random_variable"
                     )
   })
## End(No test)

# If you create a new method and need other varaibles, or just want a shorter
# representation, they can be added to your options:

global_vars("random", set = TRUE)

YF_locations$random_variable <- runif(nrow(YF_locations))
ef <- make_epiflows(flows         = YF_flows, 
                    locations     = YF_locations, 
                    pop_size      = "location_population",
                    duration_stay = "length_of_stay",
                    num_cases     = "num_cases_time_window",
                    first_date    = "first_date_cases",
                    last_date     = "last_date_cases",
                    random        = "random_variable"
                   )

# You can also reset the variables
global_vars(reset = TRUE)



