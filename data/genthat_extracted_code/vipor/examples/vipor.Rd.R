library(vipor)


### Name: vipor
### Title: Functions to generate violin scatter plots
### Aliases: vipor vipor-package

### ** Examples

dat<-list(rnorm(100),rnorm(50,1,2))
ids<-rep(1:length(dat),sapply(dat,length))
offset<-offsetX(unlist(dat),ids)
plot(unlist(dat),ids+offset)



