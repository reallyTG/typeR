library(missDeaths)


### Name: md.exp
### Title: md.exp
### Aliases: md.exp

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D   md.uniform("X1", 0.5) + 
##D     md.norm("X2") +
##D       md.exp("event", as.Date("1915-1-1"), c("X1", "X2"), c(0.1, 0.2), 0.05/365.2425)
## End(Not run)




