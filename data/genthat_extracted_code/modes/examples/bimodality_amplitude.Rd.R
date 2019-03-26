library(modes)


### Name: bimodality_amplitude
### Title: Bimodality Amplitude Function
### Aliases: bimodality_amplitude
### Keywords: Bimodality, antinode modes, peaks,

### ** Examples

#Example 1
data<-c(rnorm(21,0,1),rnorm(21,5,1))
hist(data)
bimodality_amplitude(data,TRUE)

#Example 2
dist1<-rnorm(21,5,2)
dist2<-dist1+11
data<-c(dist1,dist2)
hist(data)
bimodality_amplitude(data,TRUE)

#Example 3
dist1<-rnorm(21,-15,1)
dist2<-rep(dist1,3)+30
data<-c(dist1,dist2)
hist(data)
bimodality_amplitude(data,TRUE)



