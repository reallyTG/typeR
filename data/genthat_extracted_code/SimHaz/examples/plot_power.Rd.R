library(SimHaz)


### Name: plot_power
### Title: Plot power curves for survival analysis with time-dependent
###   exposure
### Aliases: plot_power
### Keywords: Plot

### ** Examples

# We recommend setting nSim to at least 500. It is set to 10 in the example to
# reduce run time for CRAN submission.

ret <- getpower.method1(nSim = 10, N = 600, b = 0.3, exp.prop = 0.2, 
    type = "td", scenario =  " ", maxrelexptime = 1/6, min.futime = 4, 
    min.postexp.futime = 4, output.fn = "output.csv")
	
ret2 <- getpower.method1(nSim = 10, N = 600, b = 0.3, exp.prop = 0.2, 
    type = "td", scenario = " ", maxrelexptime = 1/6, min.futime = 4, 
    min.postexp.futime = 0, output.fn ="output.csv")
	
# Read in .csv file as a data frame

tb <-  read.csv("output.csv", header = TRUE, sep = ",")

	# Visualize the subsetted data frame of interest and create a new plot

visualize1 <- plot_power(table_df = tb, N = 600, type = "td", exp.prop = 0.2,
    min.futime = 4, min.postexp.futime = 4, show.plot = TRUE, newplot = TRUE,
    col = "red", lty = 1, lwd = 2, pch = 16)

# Add a different power curve to the previously created plot

visualize2 <- plot_power(table_df = tb, N = 600, type = "td", exp.prop=0.2, 
    min.futime = 4, min.postexp.futime = 0, show.plot = TRUE, newplot = FALSE,
    col = "blue", lty = 1, lwd = 2, pch = 16)



