library(morse)


### Name: plot.survFitTT
### Title: Plotting method for 'survFitTT' objects
### Aliases: plot.survFitTT
### Keywords: plot

### ** Examples


# (1) Load the data
data(cadmium1)

# (2) Create an object of class "survData"
dat <- survData(cadmium1)

## Not run: 
##D # (3) Run the survFitTT function with the log-logistic
##D #     binomial model
##D out <- survFitTT(dat, lcx = c(5, 10, 15, 20, 30, 50, 80),
##D                  quiet = TRUE)
##D 
##D # (4) Plot the fitted curve
##D plot(out, log.scale = TRUE, adddata = TRUE)
##D 
##D # (5) Plot the fitted curve with ggplot style
##D plot(out, xlab = expression("Concentration in" ~ mu~g.L^{-1}),
##D      fitcol = "blue", adddata = TRUE, cicol = "blue",
##D      style = "ggplot")
## End(Not run)




