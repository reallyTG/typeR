library(BaM)


### Name: durations.hpd
### Title: durations.hpd
### Aliases: durations.hpd

### ** Examples

## Not run: 
##D   get("cabinet.duration")
##D   ruler <- seq(0.45,0.75,length=10000)
##D   g.vals <- round(dgamma(ruler,shape=sum(cabinet.duration$N), 
##D                   rate=sum(cabinet.duration$N*cabinet.duration$dur)),2)
##D   start.point  <- 1000; stop.point <- length(g.vals)
##D   durations.hpd(ruler,g.vals,start.point,stop.point)
## End(Not run)




