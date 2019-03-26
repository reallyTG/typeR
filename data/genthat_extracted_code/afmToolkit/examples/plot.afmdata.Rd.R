library(afmToolkit)


### Name: plot.afmdata
### Title: Plot an afmdata object
### Aliases: plot.afmdata

### ** Examples

# Loading the data
path <- path.package("afmToolkit")
data <- afmReadJPK("force-save-JPK-3h.txt.gz", path = path)
# Standard plot (out of the box)
plot(data)
# Computing the contact and detach points
data <- afmContactPoint(data, width = 20, mul1 = 1, mul2 = 10)
data <- afmDetachPoint(data, width = 40, mul1 = 3, mul2 = 20)
# Making the baseline correction
data <- afmBaselineCorrection(data)
# Plot once the baseline correction is done
plot(data)
# Plotting only retract segment
plot(data, segment = "retract")
# Plotting the pause segment: Force vs Time
plot(data, segment = "pause", vs = "Time")



