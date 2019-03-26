library(frair)


### Name: frair_boot
### Title: Bootstrap a predator-prey functional response.
### Aliases: frair_boot

### ** Examples

data(gammarus)
frair_responses() # See what is available
# A typeII fit
outII <- frair_fit(eaten~density, data=gammarus, response='rogersII', 
        start=list(a = 1.2, h = 0.015), fixed=list(T=40/24))
        
## Not run: 
##D outIIb <- frair_boot(outII) # Slow
##D confint(outIIb)
##D 
##D # Illustrate bootlines
##D plot(outIIb, xlim=c(0,30), type='n', main='All bootstrapped lines')
##D lines(outIIb, all_lines=TRUE)
##D points(outIIb, pch=20, col=rgb(0,0,0,0.2))
##D 
##D # Illustrate bootpolys
##D plot(outIIb, xlim=c(0,30), type='n', main='Empirical 95 percent CI')
##D drawpoly(outIIb, col=rgb(0,0.5,0))
##D points(outIIb, pch=20, col=rgb(0,0,0,0.2))
## End(Not run)



