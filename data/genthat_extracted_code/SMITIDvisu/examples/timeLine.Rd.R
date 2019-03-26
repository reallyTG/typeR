library(SMITIDvisu)


### Name: timeLine
### Title: timeLine
### Aliases: timeLine

### ** Examples

library(SMITIDvisu)
data(hostline)
tl <- timeLine(hostline,
               title="Example host 113",
               color=list("infected"="red","offspring"="green",
                             "alive"="blue","inf"="orange",
                             "dead"="black","Obs"="purple"))
## No test: 
## export as standalone html file
htmlwidgets::saveWidget(tl, "timeline.html")
browseURL("timeline.html")
## End(No test)




