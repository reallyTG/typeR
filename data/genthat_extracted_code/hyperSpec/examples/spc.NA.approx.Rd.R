library(hyperSpec)


### Name: spc.NA.approx
### Title: Impute missing data points
### Aliases: spc.NA.approx spc.NA.linapprox

### ** Examples

fluNA <- hyperSpec:::fluNA
spc.NA.approx (fluNA [,, min ~ 410], debuglevel = 1)
spc.NA.approx (fluNA [1,, min ~ 410], debuglevel = 2)
spc.NA.approx (fluNA [4,, min ~ 410], neighbours = 3, df = 4, debuglevel = 2)



