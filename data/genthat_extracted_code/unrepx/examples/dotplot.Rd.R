library(unrepx)


### Name: dot.plot
### Title: Resizeable dot plots
### Aliases: dot.plot dot.id dot.mod
### Keywords: hplot iplot

### ** Examples

require("unrepx")

educ = swiss$Education
names(educ) = abbreviate(row.names(swiss))
dp <- dot.plot(educ, xlab = "Percent Post-Primary Education (Switzerland, 1888)")

## Not run: 
##D     dot.id(dp)
##D     
##D     dot.mod(dp, height.id = 3, cex.id = .5)
## End(Not run)



