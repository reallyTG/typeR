library(modes)


### Name: bimodality_ratio
### Title: Bimodality Ratio Function
### Aliases: bimodality_ratio
### Keywords: bimodality, measure. modality nonparametric

### ** Examples

#Example 1
data<-c(rnorm(15,0,1),rnorm(21,5,1))
bimodality_ratio(data,FALSE)

values<-as.list(rep(list(rnorm(15,-4,2),rnorm(21,7,2),data),2))
bimodality_ratio(values,TRUE)

#Example 2
dist1<-rnorm(21,5,2)
dist2<-dist1+11
data<-c(dist1,dist2)
hist(data)
bimodality_ratio(data,FALSE)

#Example 3
dist1<-rnorm(21,-15,1)
dist2<-rep(dist1,3)+30
data<-c(dist1,dist2)
hist(data)
bimodality_ratio(data,FALSE)

#Example 4
dist1<-rep(7,70)
dist2<-rep(-7,70)
data<-c(dist1,dist2)
hist(data)
bimodality_ratio(data,FALSE)



