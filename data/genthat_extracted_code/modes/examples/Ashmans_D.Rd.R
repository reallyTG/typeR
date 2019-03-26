library(modes)


### Name: Ashmans_D
### Title: A function to calculate Ashman, Bird, and Zepf's D Statistic
### Aliases: Ashmans_D
### Keywords: Bimodality, Measure Modality Parametric,

### ** Examples

##Example 1
dist1<-rnorm(15,4,1)
dist2<-rnorm(21,5,1)
hist(c(dist1,dist2))

mu1<-mean(dist1)
mu2<-mean(dist2)
sd1<-sd(dist1)
sd2<-sd(dist2)
Ashmans_D(mu1,mu2,sd1,sd2)

##Example 2
data<-c(rnorm(15,0,1),rnorm(21,15,3))
hist(data)
Ashmans_D(0,15,1,3)



