library(states)


### Name: state_panel
### Title: Create state panel data
### Aliases: state_panel

### ** Examples

# Basic usage with full option set specified:
gwlist  <- state_panel("1991-01-01", "2015-01-01", by = "year",
                       partial = "any", useGW = TRUE)
head(gwlist, 3)
cowlist <- state_panel("1991-01-01", "2015-01-01", by = "year",
                       partial = "any", useGW = FALSE)
head(cowlist, 3)

# For yearly data, a proper date is not needed, and by = "year" and
# partial = "any" are inferred.
gwlist <- state_panel(1990, 1995)
sfind(265, list = "GW")
265 %in% gwlist$gwcode

# Partials
# Focus on South Sudan--is there a record for 2011, first year of indendence?
data(gwstates)
dplyr::filter(gwstates, gwcode==626)
# No 2011 because SSD was not indpendent on January 1st 2011
x <- state_panel("2011-01-01", "2013-01-01", by = "year", partial = "exact")
dplyr::filter(x, gwcode==626)
# Includes 2011 because 12-31 date is used for filtering
x <- state_panel("2011-12-31", "2013-12-31", by = "year", partial = "exact")
dplyr::filter(x, gwcode==626)
# Includes 2011 because partial = "any"
x <- state_panel("2011-01-01", "2013-01-01", by = "year", partial = "any")
dplyr::filter(x, gwcode==626)




