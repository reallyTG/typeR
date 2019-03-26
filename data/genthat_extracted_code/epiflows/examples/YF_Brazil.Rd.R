library(epiflows)


### Name: YF_Brazil
### Title: Yellow Fever Data from Brazil; 2016-12 to 2017-05
### Aliases: YF_Brazil Brazil_epiflows YF_flows YF_locations YF_coordinates
### Keywords: datasets

### ** Examples

# This is an example of an epiflows object
data("Brazil_epiflows")
Brazil_epiflows

# The above data was constructed from a data frame containing flows and 
# one containing location metadata
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

# Both of the above data frames were constructed like so:

data("YF_Brazil")

# Create the flows data frame
from  <- as.data.frame.table(YF_Brazil$T_D, stringsAsFactors = FALSE)
to    <- as.data.frame.table(t(YF_Brazil$T_O), stringsAsFactors = FALSE)
flows <- rbind(from, to)
colnames(flows) <- c("from", "to", "n")

## Create the locations data frame
los <- data.frame(location_code    = names(YF_Brazil$length_of_stay), 
                  length_of_stay   = YF_Brazil$length_of_stay,
                  stringsAsFactors = FALSE
                 )
locations <- merge(x   = YF_Brazil$states, 
                   y   = los, 
                   by  = "location_code", 
                   all = TRUE)

## Use both to create the epiflows object.
ef <- make_epiflows(flows, 
                    locations, 
                    pop_size = "location_population",
                    duration_stay = "length_of_stay",
                    num_cases = "num_cases_time_window",
                    first_date = "first_date_cases",
                    last_date = "last_date_cases"
)



