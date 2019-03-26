library(modes)


### Name: modes
### Title: Modes
### Aliases: modes
### Keywords: modality, mode, nonparametric

### ** Examples

#Example 1
data<-c(rep(6,9),rep(3,3))
modes(data,type=1,"NULL","NULL")

#Example 2
data<-c(rep(6,9),rep(3,9))
modes(data,type=1,"NULL","NULL")

#Example 3
data<-c(rep(6,9),rep(3,8),rep(7,7),rep(2,6))
modes(data,type=1,"NULL",2)

#Example 4
data<-c(rnorm(15,0,1),rnorm(21,5,1),rep(3,3))
modes(data)

#Example 5
data<-c(rep(6,3),rep(3,3),rnorm(15,0,1))
modes(data,3,NULL,4)
modes(data,type=2,digits=1,3)




