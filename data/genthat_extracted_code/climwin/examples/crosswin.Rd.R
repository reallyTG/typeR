library(climwin)


### Name: crosswin
### Title: Test the correlation between two climate variables.
### Aliases: crosswin

### ** Examples

## Not run: 
##D # Test correlation between temperature and rainfall in the MassClimate dataset.
##D 
##D data(Mass)
##D data(MassClimate)
##D 
##D cross <- crosswin(xvar = list(Temp = MassClimate$Temp), 
##D                  xvar2 = list(Rain = MassClimate$Rain), 
##D                  cdate = MassClimate$Date, bdate = Mass$Date, 
##D                  range = c(365, 0),
##D                  stat = "mean", stat2 = "mean", type = "relative",
##D                  cmissing = FALSE, cinterval = "day")
##D                 
##D # View the output
##D head(cross)
##D 
##D # Plot the output
##D plotcor(cross, type = "C")
##D 
## End(Not run)




