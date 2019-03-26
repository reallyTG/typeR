library(MiRSEA)


### Name: HeatMapPlot
### Title: Plot a heatmap
### Aliases: HeatMapPlot

### ** Examples

#example of expression profile
V<-matrix(runif(200),10,20)
#example of class.labels ("0"or "1")
 a1<-rep(0,20)
a1[sample(1:20,5)]=1
#plot heat map
 HeatMapPlot(V =V, row.names = FALSE, col.labels = a1, col.classes =c("a","b"), col.names =FALSE,
 main =" Heat Map for MiRs in MiR Set", xlab=" ", ylab=" ")



