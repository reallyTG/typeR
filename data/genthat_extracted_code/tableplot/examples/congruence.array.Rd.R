library(tableplot)


### Name: congruence.array
### Title: Congruence coefficients for a 3-way array
### Aliases: congruence.array
### Keywords: utilities

### ** Examples

NEO.sm <- transpose(NEO[1:12,,])
congruence.array(NEO.sm, scale=100, round=TRUE)

congruence.array(NEO.sm, FUN=function(a,b) max(abs(a-b)), stat.name="max.diff", round=2)



