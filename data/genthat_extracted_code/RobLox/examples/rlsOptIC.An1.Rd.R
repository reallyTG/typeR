library(RobLox)


### Name: rlsOptIC.An1
### Title: Computation of the optimally robust IC for An1 estimators
### Aliases: rlsOptIC.An1
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.An1(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
## don't run to reduce check time on CRAN
## Not run: 
##D plot(IC1)
##D infoPlot(IC1)
## End(Not run)



