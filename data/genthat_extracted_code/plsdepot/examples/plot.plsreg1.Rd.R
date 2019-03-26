library(plsdepot)


### Name: plot.plsreg1
### Title: Plot PLS-R1 basic results
### Aliases: plot.plsreg1

### ** Examples

## Not run: 
##D  # load dataset cornell
##D  data(cornell)
##D 
##D  # apply plsreg1
##D  myplsr1 = plsreg1(cornell[,1:7], cornell[,8,drop=FALSE])
##D 
##D  # plot variables (circle of correlations)
##D  plot(myplsr1, what="variables")
##D 
##D  # plot observations (as points) using components (t1,u1)
##D  plot(myplsr1, what="observations", comps=c(1,1), where=c("t","u"))
##D 
##D  # plot observations with names using components (t1,u1)
##D  plot(myplsr1, what="observations", comps=c(1,1),
##D       where=c("t","u"), show.names=TRUE)
##D 
##D  # plot observations (as points) using components (t1,t2)
##D  plot(myplsr1, what="observations", comps=c(1,2), where=c("t","t"))
##D 
##D  # plot observations (as points) using components (u1,u2)
##D  plot(myplsr1, what="observations", comps=c(1,2), where=c("u","u"))
##D  
## End(Not run)



