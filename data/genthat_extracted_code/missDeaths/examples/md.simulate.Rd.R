library(missDeaths)


### Name: md.simulate
### Title: md.simulate
### Aliases: md.simulate

### ** Examples


## Not run: 
##D library(missDeaths)
##D ratetable = survexp.us
##D 
##D sim = md.simparams() +
##D           md.sex("sex", 1) + 
##D           md.uniform("Z1") +
##D           md.mvnorm(c("Z2", "Z3"), c(100, 0), matrix(c(225, 3, 2, 1), 2, 2)) +
##D           md.sample("Z4", c(1, 2, 3, 4), c(0.25, 0.25, 0.25, 0.25)) +
##D           md.uniform("birth", as.Date("1930-1-1"), as.Date("1960-1-1")) +
##D           md.constant("start", as.Date("1990-1-1")) +
##D           md.death("death", ratetable, "sex", "birth", "start") +
##D           md.eval("age", "as.numeric(start - birth)/365.2425", 80, FALSE) + 
##D           md.exp("event", "start", c("age", "sex", "Z1", "Z2"), 
##D              c(0.1, 2, 1, 0.01), 0.0001)
##D           
##D data = md.simulate(sim, 1000)
## End(Not run)



