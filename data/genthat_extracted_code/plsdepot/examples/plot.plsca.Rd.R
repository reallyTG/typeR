library(plsdepot)


### Name: plot.plsca
### Title: Plot PLS-CA basic results
### Aliases: plot.plsca

### ** Examples

## Not run: 
##D  # load dataset linnerud
##D  data(linnerud)
##D 
##D  # apply plsca
##D  my_plsca = plsca(linnerud[,1:3], linnerud[,4:6])
##D 
##D  # plot variables (circle of correlations)
##D  plot(my_plsca, what="variables")
##D 
##D  # plot observations (as points) using components (t1,u1)
##D  plot(my_plsca, what="observations", comps=c(1,1), where=c("t","u"))
##D 
##D  # plot observations with names using components (t1,u1)
##D  plot(my_plsca, what="observations", comps=c(1,1),
##D       where=c("t","u"), show.names=TRUE)
##D 
##D  # plot observations (as points) using components (t1,t2)
##D  plot(my_plsca, what="observations", comps=c(1,2), where=c("t","t"))
##D 
##D  # plot observations (as points) using components (u1,u2)
##D  plot(my_plsca, what="observations", comps=c(1,2), where=c("u","u"))
##D  
## End(Not run)



