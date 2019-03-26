library(mwa)


### Name: matchedwake
### Title: Estimate Treatment Effect for Sliding Spatiotemporal Windows
### Aliases: matchedwake

### ** Examples

# Loading sample data
data(mwa_data)

# Specify required parameters:
# - 2 to 10 days in steps of 2
t_window <- c(2,10,2)
# - 2 to 10 kilometers in steps of 2
spat_window <- c(2,10,2)
# - column and entries that indicate treatment events 
treatment <- c("type","treatment")
# - column and entries that indicate control events 
control  <- c("type","control")
# - column and entries that indicate dependent events 
dependent <- c("type","dependent")
# - columns to match on
matchColumns <- c("match1","match2")

# Specify optional parameters:
# - use weighted regression (default estimation method is "lm")
weighted <- TRUE
# - temporal units
t_unit <- "days" 
# - match on counts of previous treatment and control events
TCM <- TRUE

## Not run: 
##D # Execute method:
##D results <- matchedwake(mwa_data, t_window, spat_window, treatment, control, dependent,
##D                        matchColumns, weighted = weighted, t_unit = t_unit, TCM = TCM)
##D 
##D # Plot results:
##D plot(results)
##D 
##D # Return detailed summary of results:
##D summary(results, detailed = TRUE)
## End(Not run)




