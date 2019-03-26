library(BETS)


### Name: sidraGet
### Title: A function to extract Sidra series using their API
### Aliases: sidraGet
### Keywords: sidra

### ** Examples

## Not run: 
##D sidra = sidraGet(x = c(1612), from = 1990, to = 2015, territory = "brazil", variable =109)
##D sidra = sidraGet(x = c(3653), from = c("200201"), 
##D to = c("201703"), territory = "brazil", 
##D variable = 3135, sections = c(129316,129330), cl = 544)
##D sidra = sidraGet(x = c(3653), from = c("200201"), 
##D to = c("201512"), territory = "brazil",  variable = 3135, 
##D sections = "all", cl = 544)
##D sidra = sidraGet(x = c(1618), from = c("201703"), to = c("201703"), 
##D territory = "brazil",
##D variable = 109, sections=list(c(39427), c(39437,39441)), cl = c(49, 48))
##D trim - x = 1620; from = 199001; to = 201701;  territory = "brazil"; 
##D sections = list(c(90687)); cl =c(11255); variable = 583
##D sidra = sidraGet(x = 1620, from = 199001, to = 201701,  
##D territory = "brazil",
##D sections=list(c(90687)), cl =c(11255), variable = 583)
## End(Not run)



