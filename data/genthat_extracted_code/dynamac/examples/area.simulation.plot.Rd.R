library(dynamac)


### Name: area.simulation.plot
### Title: Create an area plot of a simulated response in a dynardl model
### Aliases: area.simulation.plot
### Keywords: utilities

### ** Examples

# Using the ineq data in dynamac
# Shocking Income Top 10
ardl.model <- dynardl(concern ~ incshare10 + urate, data = ineq, 
       lags = list("concern" = 1, "incshare10" = 1),
       diffs = c("incshare10", "urate"), 
       lagdiffs = list("concern" = 1),
       ec = TRUE, simulate = TRUE, range = 30,
       shockvar = "incshare10")
area.simulation.plot(ardl.model)	# Shows absolute levels
area.simulation.plot(ardl.model, response = "mean.changes")  # Shows changes from mean level
area.simulation.plot(ardl.model, bw = TRUE)	 # Grayscale plots



