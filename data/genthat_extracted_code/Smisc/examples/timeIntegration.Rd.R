library(Smisc)


### Name: timeIntegration
### Title: Approximate the integral of a vector of data over time
### Aliases: timeIntegration
### Keywords: misc

### ** Examples

# Some example power data
data(PowerData)

par(mfrow = c(2, 1))

# Calculate the kilowatt-minutes, display graph which shows how the
# integration is done.  This example calculates the integral using
# a contiguous subset of the data
int1 <- timeIntegration(PowerData,
                       # Convert to POSIXct in order to subtract time
                       lower = "5/6/2008 17:00:09",
                       upper = "5/6/2008 17:01:36",
                       check.plot = TRUE, units = "m")

# This example calculates the integral for all the data in 'powerData'
int2 <- timeIntegration(PowerData, check.plot = TRUE, units = "m")

# Print the outcome
pvar(int1, int2)



