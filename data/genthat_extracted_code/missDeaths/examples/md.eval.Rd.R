library(missDeaths)


### Name: md.eval
### Title: md.eval
### Aliases: md.eval

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D     md.uniform("birth", as.Date("1915-1-1"), as.Date("1930-1-1")) +
##D       md.uniform("start", as.Date("2000-1-1"), as.Date("2005-1-1")) +
##D           md.eval("age", "as.numeric(start - birth)/365.2425", 80, FALSE)
## End(Not run)



