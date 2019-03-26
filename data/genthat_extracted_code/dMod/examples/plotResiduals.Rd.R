library(dMod)


### Name: plotResiduals
### Title: Plot residuals for a fitlist
### Aliases: plotResiduals

### ** Examples

## Not run: 
##D  # time axis:
##D  plotResiduals(myfitlist, g*x*p, data, 
##D     c("time","index","condition","name"), 
##D     conditions = myconditions[1:4])
##D  # condition axis (residuals summed over time for each observable and condition):
##D  plotResiduals(myfitlist, g*x*p, data,  c("condition","name","index"))
## End(Not run)



