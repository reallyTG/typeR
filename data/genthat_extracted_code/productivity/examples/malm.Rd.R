library(productivity)


### Name: malm
### Title: Malmquist productivity index
### Aliases: malm print.Malmquist
### Keywords: models

### ** Examples


## Malmquist productivity index compares each observation in period 1 to the same 
## observation in period 0
## Not run: 
##D   Malmquist <- malm(data = usagri, id.var = "States", time.var = "Years", 
##D   x.vars = c("q.capital", "q.land","q.labor","q.materials"), 
##D   y.vars = c("q.livestock", "q.crop", "q.other"), rts = "nirs")
##D   Malmquist
## End(Not run)



