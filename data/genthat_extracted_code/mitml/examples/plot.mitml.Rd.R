library(mitml)


### Name: plot.mitml
### Title: Print diagnostic plots
### Aliases: plot.mitml
### Keywords: methods

### ** Examples

## Not run: 
##D data(studentratings)
##D 
##D # * Example 1: simple imputation
##D 
##D fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
##D imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)
##D 
##D # plot all parameters (default)
##D plot(imp)
##D 
##D # plot fixed effects only
##D plot(imp, print="beta")
##D 
##D # export plots to file (using pdf device)
##D plot(imp, export="pdf", dev.args=list(width=9, height=4, pointsize=12))
##D 
##D # * Example 2: groupwise imputation
##D 
##D fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
##D imp <- panImpute(studentratings, formula=fml, group=FedState, n.burn=1000,
##D        n.iter=100, m=5)
##D 
##D # plot fixed effects for all groups (default for 'group')
##D plot(imp, print="beta", group="all")
##D 
##D # plot fixed effects for first group only
##D plot(imp, print="beta", group=1)
## End(Not run)



