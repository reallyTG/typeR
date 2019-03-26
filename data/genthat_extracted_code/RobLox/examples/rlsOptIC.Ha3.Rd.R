library(RobLox)


### Name: rlsOptIC.Ha3
### Title: Computation of the optimally robust IC for Ha3 estimators
### Aliases: rlsOptIC.Ha3
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.Ha3(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
## don't run to reduce check time on CRAN
## Not run: 
##D plot(IC1)
##D infoPlot(IC1)
## End(Not run)



