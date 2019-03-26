library(wgeesel)


### Name: ylag
### Title: Generate subject-level lagged response
### Aliases: ylag
### Keywords: gee lag

### ** Examples

id <- rep(c(1:20),each=3)
y <- rnorm(length(id))
ylag(id,y,1) #lag=1
ylag(id,y,2,na=FALSE) #lag=2



