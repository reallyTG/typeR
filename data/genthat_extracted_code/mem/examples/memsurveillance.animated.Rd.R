library(mem)


### Name: memsurveillance.animated
### Title: Creates the animated graph of the surveillance of the current
###   season
### Aliases: memsurveillance.animated
### Keywords: influenza

### ** Examples

# Castilla y Leon Influenza Rates data
data(flucyl)
# Data of the last season
cur<-flucyl[8]
# The model
epi<-memmodel(flucyl[1:7])
# Epidemic thresholds
e.thr<-epi$epidemic.thresholds
# Intensity threhsolds
i.thr<-epi$intensity.thresholds
# Set the working directory to whererever you want to store the graph file
setwd(".")
m1<-memsurveillance.animated(cur, i.animated.graph.file.name="Animated",
i.epidemic.thresholds = e.thr,i.intensity.thresholds = i.thr, i.pos.epidemic = TRUE,
i.animated.graph.file = FALSE)




