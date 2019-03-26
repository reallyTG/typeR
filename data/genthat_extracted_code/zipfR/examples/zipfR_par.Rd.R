library(zipfR)


### Name: zipfR.par
### Title: Set or Query Graphics Parameters (zipfR)
### Aliases: zipfR.par
### Keywords: iplot

### ** Examples


print(names(zipfR.par()))         # list available parameters

zipfR.par("col", "lty", "lwd")    # the default line styles
zipfR.par(c("col", "lty", "lwd")) # works as well

## temporary changes to graphics paramters:
par.save <- zipfR.par(bw=TRUE, lwd.bw=2)
## plots use the modified parameters here
zipfR.par(par.save)		  # restore previous values




