library(plsdepot)


### Name: interbat
### Title: Tucker's Inter-Battery Method of Factor Analysis
### Aliases: interbat

### ** Examples

## Not run: 
##D  # load data linnerud
##D  data(linnerud)
##D 
##D  # apply inter-battery method
##D  ib = interbat(linnerud[,1:3], linnerud[,4:6])
##D 
##D  # plot variables
##D  plot(ib, what="variables")
##D 
##D  # plot observations
##D  plot(ib, what="observations", comps=c(1,1), where=c("t","u"))
##D  
## End(Not run)



