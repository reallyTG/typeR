library(SetMethods)


### Name: xy.plot
### Title: Function producing enhanced XY plots
### Aliases: xy.plot

### ** Examples


# Load the Schneider data:

data(SCHF)

# Plot of condition EMP as necessary for outcome EXPORT with case labels 
# and names for the plot and axes:

xy.plot("EMP", "EXPORT", data=SCHF, necessity = TRUE,
            main = "EMP as necessary for EXPORT", ylab = "EXPORT", xlab = "EMP")



