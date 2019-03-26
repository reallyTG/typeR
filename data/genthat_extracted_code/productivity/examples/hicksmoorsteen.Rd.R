library(productivity)


### Name: hicksmoorsteen
### Title: Hicks-Moorsteen productivity and profitability index
### Aliases: hicksmoorsteen print.HicksMoorsteen
### Keywords: models

### ** Examples


## Hicks-Moorsteen productivity, without price information
## Not run: 
##D   Hicks1 <- hicksmoorsteen(data = usagri, id.var = "States", time.var = "Years", x.vars = c(7:10), 
##D   y.vars = c(4:6), rts = "crs", orientation = "in")
##D   Hicks1
## End(Not run)
## Hicks-Moorsteen productivity and profitability, with price information
## Not run: 
##D Hicks2 <- hicksmoorsteen(data = usagri, id.var = "States", time.var = "Years", 
##D   x.vars = c(7:10), y.vars = c(4:6), w.vars = c(14:17), p.vars = c(11:13))
##D   Hicks2
## End(Not run)



