library(agricolae)


### Name: stat.freq
### Title: Descriptive measures of grouped data
### Aliases: stat.freq
### Keywords: univar

### ** Examples

library(agricolae)
data(growth)
grouped<-with(growth,hist(height,plot=FALSE))
measures<-stat.freq(grouped)
print(measures)




