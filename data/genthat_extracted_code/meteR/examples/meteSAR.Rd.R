library(meteR)


### Name: meteSAR
### Title: Compute METE species area relationship (SAR)
### Aliases: meteSAR

### ** Examples

## Not run: 
##D data(anbo)
##D 
##D ## using row and col from anbo dataset
##D anbo.sar1 <- meteSAR(anbo$spp, anbo$count, anbo$row, anbo$col, Amin=1, A0=16)
##D plot(anbo.sar1)
##D 
##D ## using simulated x, y data
##D anbo.sar2 <- meteSAR(anbo$spp, anbo$count, x=anbo$x, y=anbo$y, row=4, col=4)
##D plot(anbo.sar2)
##D 
##D ## using just state variable
##D thr.sar <- meteSAR(Amin=1, A0=16, S0=50, N0=500)
## End(Not run)



