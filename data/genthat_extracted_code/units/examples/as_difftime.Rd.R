library(units)


### Name: as_difftime
### Title: convert units object into difftime object
### Aliases: as_difftime

### ** Examples


t1 = Sys.time() 
t2 = t1 + 3600 
d = t2 - t1
du <- as_units(d)
dt = as_difftime(du)
class(dt)
dt



