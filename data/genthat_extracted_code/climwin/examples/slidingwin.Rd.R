library(climwin)


### Name: slidingwin
### Title: Test for a climate windows in data.
### Aliases: slidingwin

### ** Examples

## Not run: 
##D ##EXAMPLE 1## 
##D  
##D # Test both a linear and quadratic variable climate window using datasets "Offspring"
##D # and "OffspringClimate".
##D 
##D # Load data.
##D 
##D data(Offspring) 
##D data(OffspringClimate)
##D 
##D # Test both linear and quadratic functions with climate variable temperature
##D 
##D OffspringWin <- slidingwin(xvar = list(Temp = OffspringClimate$Temperature), 
##D                           cdate = OffspringClimate$Date, 
##D                           bdate = Offspring$Date, 
##D                           baseline = glm(Offspring ~ 1, data = Offspring, family = poisson),
##D                           range = c(150, 0), 
##D                           type = "relative", stat = "mean", 
##D                           func = c("lin", "quad"), cmissing = FALSE, cinterval = "day")
##D 
##D # Examine tested combinations
##D  
##D OffspringWin$combos
##D      
##D # View output for func = "lin"
##D  
##D head(OffspringWin[[1]]$Dataset) 
##D summary(OffspringWin[[1]]$BestModel)
##D  
##D # View output for func = "quad"
##D  
##D head(OffspringWin[[2]]$Dataset)
##D summary(OffspringWin[[2]]$BestModel)
##D  
##D ##EXAMPLE 2##
##D  
##D # Test for an absolute climate window with both 'mean' and 'max' aggregate statistics
##D # using datasets 'Mass' and 'MassClimate'.
##D  
##D # Load data.
##D  
##D data(Mass)
##D data(MassClimate)
##D  
##D # Test an absolute window, starting 20 May (refday = c(20, 5))
##D # Test for climate windows between 100 and 0 days ago (range = c(100, 0))
##D # Test both mean and max aggregate statistics (stat = c("mean", "max"))
##D # Fit a linear term (func = "lin")
##D # Test at the resolution of days (cinterval = "day")
##D  
##D MassWin <- slidingwin(xvar = list(Temp = MassClimate$Temp), cdate = MassClimate$Date, 
##D                      bdate = Mass$Date, baseline = lm(Mass ~ 1, data = Mass),
##D                      range = c(100, 0),
##D                      stat = c("mean", "max"), func = "lin",
##D                      type = "absolute", refday = c(20, 5),
##D                      cmissing = FALSE, cinterval = "day")
##D                        
##D # Examine tested combinations
##D  
##D MassWin$combos                      
##D  
##D # View output for mean temperature
##D  
##D head(MassWin[[1]]$Dataset)
##D summary(MassWin[[1]]$BestModel)
##D  
##D # View output for max temperature
##D  
##D head(MassWin[[2]]$Dataset)
##D summary(MassWin[[2]]$BestModel)
##D  
## End(Not run)
 



