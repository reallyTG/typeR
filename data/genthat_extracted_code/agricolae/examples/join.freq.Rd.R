library(agricolae)


### Name: join.freq
### Title: Join class for histogram
### Aliases: join.freq
### Keywords: univar

### ** Examples

library(agricolae)
data(natives)
# histogram
h1<-graph.freq(natives$size,plot=FALSE)
round(table.freq(h1),4)
# Join classes  9, 10,11 and 12 with little frequency.
h2<-join.freq(h1,9:12)
# new table
plot(h2,col="bisque",xlab="Size")
round(summary(h2),4)



