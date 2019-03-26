library(plotrix)


### Name: bumpchart
### Title: Display a "bumps" chart
### Aliases: bumpchart
### Keywords: misc

### ** Examples

 # percentage of those over 25 years having completed high school
 # in 10 cities in the USA in 1990 and 2000
 educattn<-matrix(c(90.4,90.3,75.7,78.9,66,71.8,70.5,70.4,68.4,67.9,
  67.2,76.1,68.1,74.7,68.5,72.4,64.3,71.2,73.1,77.8),ncol=2,byrow=TRUE)
 rownames(educattn)<-c("Anchorage AK","Boston MA","Chicago IL",
  "Houston TX","Los Angeles CA","Louisville KY","New Orleans LA",
  "New York NY","Philadelphia PA","Washington DC")
 colnames(educattn)<-c(1990,2000)
 bumpchart(educattn,main="Rank for high school completion by over 25s",
  arrows=TRUE,length=0.2)
 vallab<-c(paste(educattn[,2],rownames(educattn),sep="-"),
  paste(rownames(educattn),educattn[,1],sep="-"))
 # now show the raw percentages and add central ticks
 bumpchart(educattn,rank=FALSE,labels=vallab,
  main="Percentage high school completion by over 25s",
  lty=1:10,lwd=1,col=rainbow(10))
 # margins have been reset, so use
 par(xpd=TRUE)
 boxed.labels(1.5,seq(65,90,by=5),seq(65,90,by=5))
 par(xpd=FALSE)



