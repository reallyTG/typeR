library(missDeaths)


### Name: md.simparams
### Title: md.simparams
### Aliases: md.simparams

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.sex("sex", 0.5) + 
##D    md.uniform("birth", as.Date("1930-1-1"), as.Date("1960-1-1")) +
##D    md.uniform("start", as.Date("2005-1-1"), as.Date("2010-1-1")) +
##D    md.death("death", survexp.us, "sex", "birth", "start") 
## End(Not run)




