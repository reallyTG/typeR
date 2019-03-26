library(fDMA)


### Name: plot.altf2
### Title: Plots Selected Outcomes from 'altf2' Object.
### Aliases: plot.altf2

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D a <- altf2(y=wti,x=drivers,av="aic")
##D 
##D plot(a)
## End(Not run)



