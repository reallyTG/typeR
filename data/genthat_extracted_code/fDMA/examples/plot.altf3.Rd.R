library(fDMA)


### Name: plot.altf3
### Title: Plots Selected Outcomes from 'altf3' Object.
### Aliases: plot.altf3

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D a <- altf3(y=wti,x=drivers,windows=c(36,100,150))
##D 
##D plot(a)
## End(Not run)



