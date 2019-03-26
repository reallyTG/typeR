library(climwin)


### Name: autowin
### Title: Test for auto-correlation in climate.
### Aliases: autowin

### ** Examples

## Not run: 
##D 
##D # Test for auto-correlation using 'Mass' and 'MassClimate' data frames
##D 
##D data(Mass)
##D data(MassClimate)
##D 
##D # Fit a single climate window using the datasets Mass and MassClimate.
##D 
##D single <- singlewin(xvar = list(Temp = MassClimate$Temp), 
##D                     cdate = MassClimate$Date, bdate = Mass$Date,
##D                     baseline = lm(Mass ~ 1, data = Mass), 
##D                     range = c(72, 15), 
##D                     stat = "mean", func = "lin", type = "absolute", 
##D                     refday = c(20, 5), 
##D                     cmissing = FALSE, cinterval = "day")            
##D 
##D # Test the autocorrelation between the climate in this single window and other climate windows.
##D 
##D auto <- autowin(reference = single,
##D                 xvar  = list(Temp = MassClimate$Temp), cdate = MassClimate$Date, bdate = Mass$Date,
##D                 baseline = lm(Mass ~ 1, data = Mass), range = c(365, 0), 
##D                 stat = "mean", func = "lin", 
##D                 type = "absolute", refday = c(20, 5),
##D                 cmissing = FALSE, cinterval = "day")
##D                 
##D # View the output
##D head(auto)
##D 
##D # Plot the output
##D plotcor(auto, type = "A")                                   
## End(Not run)
       



