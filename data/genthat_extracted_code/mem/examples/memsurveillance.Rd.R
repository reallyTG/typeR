library(mem)


### Name: memsurveillance
### Title: Creates the surveillance graph of the current season
### Aliases: memsurveillance
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
# The graph, default values
m1<-memsurveillance(cur,e.thr,i.thr,i.graph.file=TRUE,
     i.graph.file.name="graph 1")
# No intensity levels
m2<-memsurveillance(cur,e.thr,i.thr,i.graph.file=TRUE,
     i.graph.file.name="graph 2",i.no.intensity=TRUE)
# No start/end tickmarks
m3<-memsurveillance(cur,e.thr,i.thr,i.graph.file=TRUE,
     i.graph.file.name="graph 3",i.start.end.marks=FALSE)
# Post-epidemic threshold
m4<-memsurveillance(cur,e.thr,i.thr,i.graph.file=TRUE,
     i.graph.file.name="graph 4",i.pos.epidemic=TRUE)
# Report for week 2, instead of all data
m5<-memsurveillance(cur,e.thr,i.thr,i.graph.file=TRUE,
     i.graph.file.name="graph 5",i.week.report=2)




