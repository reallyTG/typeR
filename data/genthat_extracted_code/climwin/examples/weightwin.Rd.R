library(climwin)


### Name: weightwin
### Title: Find a weighted climate window
### Aliases: weightwin

### ** Examples

 ## Not run: 
##D  
##D # Test for a weighted average over a fixed climate window 
##D # using datasets 'Offspring' and 'OffspringClimate'
##D  
##D # N.B. THIS EXAMPLE MAY TAKE A MOMENT TO CONVERGE ON THE BEST MODEL.
##D  
##D # Load data
##D  
##D data(Offspring)
##D data(OffspringClimate)
##D  
##D # Test for climate windows between 365 and 0 days ago (range = c(365, 0))
##D # Fit a quadratic term for the mean weighted climate (func="quad")
##D # in a Poisson regression (offspring number ranges 0-3)
##D # Test a variable window (type = "absolute")
##D # Test at the resolution of days (cinterval="day")
##D # Uses a Weibull weight function (weightfunc="week")
##D  
##D weight <- weightwin(xvar = list(Temp = OffspringClimate$Temperature), 
##D                    cdate = OffspringClimate$Date, 
##D                    bdate = Offspring$Date, 
##D                    baseline = glm(Offspring ~ 1, family = poisson, data = Offspring), 
##D                    range = c(365, 0), func = "quad", 
##D                    type = "relative", weightfunc = "W", cinterval = "day", 
##D                    par = c(3, 0.2, 0), control = list(ndeps = c(0.01, 0.01, 0.01)), 
##D                    method = "L-BFGS-B") 
##D  
##D # View output
##D  
##D head(weight[[3]])
##D summary(weight[[1]])
##D head(weight[[2]])
##D  
## End(Not run)




