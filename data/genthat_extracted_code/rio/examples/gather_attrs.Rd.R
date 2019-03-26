library(rio)


### Name: gather_attrs
### Title: Gather attributes from data frame variables
### Aliases: gather_attrs spread_attrs

### ** Examples

e <- import("http://www.stata-press.com/data/r13/auto.dta")
str(e)
g <- gather_attrs(e)
str(attributes(e))
str(g)



