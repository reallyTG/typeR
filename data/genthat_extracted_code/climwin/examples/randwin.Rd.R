library(climwin)


### Name: randwin
### Title: Climate window analysis for randomised data
### Aliases: randwin

### ** Examples

## Not run: 
##D 
##D ## EXAMPLE 1 ##
##D 
##D # Test climate windows in randomised data using a sliding window approach.
##D 
##D data(Mass)
##D data(MassClimate)
##D 
##D # Randomise data twice
##D # Note all other parameters are fitted in the same way as the climatewin function.
##D 
##D rand <- randwin(repeats = 2, window = "sliding", 
##D                xvar = list(Temp = MassClimate$Temp), 
##D                cdate = MassClimate$Date, bdate = Mass$Date,
##D                baseline = lm(Mass ~ 1, data = Mass), 
##D                range = c(100, 0),
##D                stat = "mean", func = "lin", type = "absolute", 
##D                refday = c(20, 5),
##D                cmissing = FALSE, cinterval = "day")
##D                 
##D # View output #
##D 
##D head(rand)
##D 
##D ## EXAMPLE 2 ##
##D 
##D # Test climate windows in randomised data using a weighted window approach.
##D   
##D data(Offspring)
##D data(OffspringClimate)
##D 
##D # Randomise data twice
##D # Note all other parameters are fitted in the same way as the weightwin function.
##D 
##D weightrand <- randwin(repeats = 2, window = "weighted", 
##D                      xvar = list(Temp = OffspringClimate$Temperature), 
##D                      cdate = OffspringClimate$Date,
##D                      bdate = Offspring$Date,
##D                      baseline = glm(Offspring ~ 1, family = poisson, data = Offspring),
##D                      range = c(365, 0), func = "quad",
##D                      type = "relative", weightfunc = "W", cinterval = "day",
##D                      par = c(3, 0.2, 0), control = list(ndeps = c(0.01, 0.01, 0.01)),
##D                      method = "L-BFGS-B")
##D                    
##D # View output
##D 
##D head(weightrand)
##D                           
##D        
## End(Not run)




