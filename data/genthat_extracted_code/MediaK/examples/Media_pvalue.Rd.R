library(MediaK)


### Name: Media_pvalue
### Title: functions to calculate pvalue
### Aliases: Media_pvalue

### ** Examples


iTest <- matrix(rnorm(1000),100)
jTest<- matrix(rnorm(200),100)
times<- 100
selectvec <- c(1:10)
Media_pvalue(iTest,jTest,times,selectvec)





