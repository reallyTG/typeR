library(productivity)


### Name: fareprim
### Title: Färe-Primont productivity and profitability index
### Aliases: fareprim print.FarePrimont
### Keywords: models

### ** Examples


## Färe-Primont productivity, without price information
## Not run: 
##D   FareP1 <- fareprim(data = usagri, id.var = "States", time.var = "Years", x.vars = c(7:10), 
##D   y.vars = c(4:6), rts = "crs", orientation = "in", by.id = 1, by.year = 1)
##D   FareP1
## End(Not run)
## Färe-Primont productivity and profitability, with price information
## Not run: 
##D   FareP2 <- fareprim(data = usagri, id.var = "States", time.var = "Years", x.vars = c(7:10), 
##D   y.vars = c(4:6), w.vars = c(14:17), p.vars = c(11:13), by.id = 1, by.year = 1)
##D   FareP2
## End(Not run)



