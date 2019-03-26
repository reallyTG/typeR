library(climwin)


### Name: singlewin
### Title: Fit a single climate window
### Aliases: singlewin

### ** Examples

## Not run: 
##D # Fit a known climate window to the datasets Mass and MassClimate
##D 
##D data(Mass)
##D data(MassClimate)
##D 
##D # Test for a fixed climate window, starting from 20th May
##D # Fit a climate window starting 72 days ago and ending 15 days ago
##D # Fit a linear term for the mean climate
##D # Fit climate windows at the resolution of days
##D 
##D single <- singlewin(xvar = list(Temp = MassClimate$Temp), 
##D                    cdate = MassClimate$Date, bdate = Mass$Date,
##D                    baseline = lm(Mass ~ 1, data = Mass), 
##D                    range = c(72, 15),
##D                    stat = "mean", func = "lin",
##D                    type = "absolute", refday = c(20, 5),
##D                    cmissing = FALSE, cinterval = "day")
##D                
##D ##View data##
##D single$BestModel
##D head(single$BestModelData)
## End(Not run)




