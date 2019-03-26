library(morse)


### Name: plot.survDataCstExp
### Title: Plotting method for 'survData' objects
### Aliases: plot.survDataCstExp
### Keywords: plot

### ** Examples

# (1) Load the data
data(zinc)
zinc <- survData(zinc)

# (2) Plot survival data with a ggplot style
plot(zinc)

# (3) Plot the survival data for one specific concentration
plot(zinc, concentration = 0.66)




