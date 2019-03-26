library(difNLR)


### Name: plot.difNLR
### Title: ICC and test statistics plots for difNLR object
### Aliases: plot.difNLR

### ** Examples

## Not run: 
##D # loading data based on GMAT
##D data(GMAT)
##D 
##D Data  <- GMAT[, 1:20]
##D group <- GMAT[, "group"]
##D 
##D # Testing both DIF effects using likelihood-ratio test and
##D # 3PL model with fixed guessing for groups
##D (x <- difNLR(Data, group, focal.name = 1, model = "3PLcg"))
##D 
##D # Graphical devices
##D plot(x)
##D plot(x, item = x$DIFitems)
##D plot(x, plot.type = "stat")
## End(Not run)



