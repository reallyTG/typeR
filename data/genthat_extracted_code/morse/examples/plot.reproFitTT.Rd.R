library(morse)


### Name: plot.reproFitTT
### Title: Plotting method for 'reproFitTT' objects
### Aliases: plot.reproFitTT
### Keywords: plot

### ** Examples


# (1) Load the data
data(cadmium1)

# (2) Create an object of class "reproData"
dataset <- reproData(cadmium1)

## Not run: 
##D # (3) Run the reproFitTT function with the log-logistic gamma-Poisson model
##D out <- reproFitTT(dataset, stoc.part = "gammapoisson",
##D                   ecx = c(5, 10, 15, 20, 30, 50, 80), quiet = TRUE)
##D 
##D 
##D # (4) Plot the fitted curve with generic style
##D plot(out, xlab = expression("Concentration in" ~ mu~g.L^{-1}),
##D      fitcol = "blue", cicol = "lightblue",
##D      main = "Log-logistic response to concentration")
## End(Not run)




