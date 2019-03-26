library(matR)


### Name: boxplot.biom
### Title: Summarize BIOM data in boxplots
### Aliases: boxplot boxplot.biom

### ** Examples

####  simple use
xx2t <- transform (xx2, t_Log)
boxplot (xx2t, main="log transformed data", notch=FALSE)

####  plotting raw and normalized against each other
columns (xx2t, "material")
boxplot (xx2t, xx2, x.main="log of data", y.main="raw data", map=c(col="material"),
  col=c("freshwater"="darkorange", "hot spring"="slateblue", 
  "hot spring ; microbial mat"="chocolate4"), notch=FALSE)

####  label by metadata
columns (xx4, "sample_name")
boxplot (transform (xx4, t_Log), names="$$sample.data.sample_name", notch=FALSE)

####  two normalizations plotted against each other
xx2tt <- transform (xx2, t_Threshold=list(entry.min=5), t_Log)
boxplot (xx2t, xx2tt, notch=FALSE, x.main="log transformation", 
  y.main="low counts removed, then log transformation")



