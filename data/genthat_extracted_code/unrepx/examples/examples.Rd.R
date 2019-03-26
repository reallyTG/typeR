library(unrepx)


### Name: pdEff
### Title: Effect examples
### Aliases: pdEff bikeEff viseEff shnkEff shnkDisp
### Keywords: datasets

### ** Examples

require("unrepx")

parplot(bikeEff, method = "Zahn")

opar <- par(mfcol = c(1,2))
  hnplot(shnkEff, half = FALSE, main = "Normal plot")
  hnplot(shnkEff, half = TRUE, main = "Half-Normal plot")
#   Why ordinary normal plots are a bad idea
#   Both plots have the same reference line
par(opar)

# Note - Examples in help pages for hnplot, parplot, refplot, and eff.test
#        use pdEff for illustration

## Not run: 
##D     # Do try this at home:
##D     hnplot(viseEff, ID = TRUE)
##D     refplot(viseEff, ID = TRUE)
## End(Not run)



