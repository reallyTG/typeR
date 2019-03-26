library(prettymapr)


### Name: prettymap
### Title: Plot A Pretty Map
### Aliases: prettymap

### ** Examples

prettymap(plot(1:5, 1:5, asp=1), scale.plotunit="cm", drawarrow=FALSE)
#add a title
prettymap(plot(1:5, 1:5, asp=1), title="My Plot")
## No test: 
library(maptools)
data(wrld_simpl)
prettymap({plot(wrld_simpl, xlim=c(-66.86, -59.75), ylim=c(43, 47.3))
           text(-62, 44, "Nova Scotia")
           text(-63, 47, "PEI")}, arrow.scale=1.1)

#also works in non-lat/lon coordinate systems
prettymap(plot(1:1000, 1:1000, asp=1),
           scale.plotepsg=26920, drawarrow=FALSE) #specify plot is in UTM Zone 20N
## End(No test)




