library(states)


### Name: plot_missing
### Title: Visualize missing and non-proper cases for state panel data
### Aliases: plot_missing missing_info

### ** Examples

# Create an example data frame with missing values
cy <- state_panel(as.Date("1980-06-30"), as.Date("2015-06-30"), by = "year",
useGW = TRUE)
cy$myvar <- rnorm(nrow(cy))
cy$myvar[sample(1:nrow(cy), nrow(cy)*.1, replace = FALSE)] <- NA
str(cy)

# Visualize missing values:
plot_missing("myvar", cy, "gwcode", "date", "year", "none")

# missing_info() generates the data underlying plot_missing():
head(missing_info("myvar", cy, "gwcode", "date", "year", "none"))

# if we specify a statelist to check against, 'independent' will have values
# now:
head(missing_info("myvar", cy, "gwcode", "date", "year", "GW"))

# Check data also against G&W list of independent states
head(missing_info("myvar", cy, "gwcode", "date", "year", "GW"))
plot_missing("myvar", cy, "gwcode", "date", "year", "GW")

# To check all variables:
# plot_missing(setdiff(colnames(df), "space", "time"), ...)

# Live example with Polity data
data("polity")
head(polity)
polity$date <- as.Date(paste0(polity$year, "-12-31"))
plot_missing(polity, "polity", "ccode", "date", "year", "COW")
# COW starts in 1816; Polity has excess data for several non-independent
# states after that date, and is missing coverage for several countries.

# The date option is relevant for years in which states gain or lose
# independence, so this will be slighlty different:
polity$date <- as.Date(paste0(polity$year, "-01-01"))
plot_missing(polity, "polity", "ccode", "date", "year", "COW")

# plot_missing returns a ggplot2 object, so you can do anything you want
plot_missing(polity, "polity", "ccode", "date", "year", "COW") +
  ggplot2::coord_flip()



