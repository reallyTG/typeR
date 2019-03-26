library(prettymapr)


### Name: scalebarparams
### Title: Get Scale Bar Parameters
### Aliases: scalebarparams

### ** Examples

plot(1:5, 1:5, asp=1)
scalebarparams(plotunit="m")
## No test: 
library(maptools)
data(wrld_simpl)
plot(wrld_simpl, xlim=c(-66.86, -59.75), ylim=c(43, 47.3)) # Nova Scotia
scalebarparams()
## End(No test)




