library(missDeaths)


### Name: md.censor
### Title: Censoring simulated survival data
### Aliases: md.censor

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D   md.sex("sex", 0.5) + 
##D     md.uniform("birth", as.Date("1915-1-1"), as.Date("1930-1-1")) +
##D       md.uniform("start", as.Date("2000-1-1"), as.Date("2005-1-1")) +
##D         md.death("death", survexp.us, "sex", "birth", "start") +
##D           md.eval("age", "as.numeric(start - birth)/365.2425", 80, FALSE) + 
##D             md.exp("event", "start", c("age", "sex"), c(0.1, 2), 0.05/365.2425)
##D             
##D data = md.simulate(sim, 1000)
##D complete = md.censor(data, "start", as.Date("2010-1-1"), c("event", "death"))
## End(Not run)




