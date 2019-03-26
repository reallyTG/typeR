library(plsdepot)


### Name: plot.interbat
### Title: Plot inter-battery basic results
### Aliases: plot.interbat

### ** Examples

## Not run: 
##D  # load dataset linnerud
##D  data(linnerud)
##D 
##D  # apply nipals
##D  ib = interbat(linnerud[,1:3], linnerud[,4:6])
##D 
##D  # plot variables (circle of correlations)
##D  plot(ib, what="variables")
##D 
##D  # plot observations (as points) using components (t1,u1)
##D  plot(ib, what="observations", comps=c(1,1), where=c("t","u"))
##D 
##D  # plot observations with names using components (t1,u1)
##D  plot(ib, what="observations", comps=c(1,1),
##D       where=c("t","u"), show.names=TRUE)
##D 
##D  # plot observations (as points) using components (t1,t2)
##D  plot(ib, what="observations", comps=c(1,2), where=c("t","t"))
##D 
##D  # plot observations (as points) using components (u1,u2)
##D  plot(ib, what="observations", comps=c(1,2), where=c("u","u"))
##D  
## End(Not run)



