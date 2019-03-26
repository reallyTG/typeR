library(imager)


### Name: cannyEdges
### Title: Canny edge detector
### Aliases: cannyEdges

### ** Examples

cannyEdges(boats) %>% plot
#Make thresholds less strict
cannyEdges(boats,alpha=.4) %>% plot
#Make thresholds more strict
cannyEdges(boats,alpha=1.4) %>% plot



