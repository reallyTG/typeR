library(astrochron)


### Name: cb
### Title: Combine multiple vectors
### Aliases: cb

### ** Examples

# example dataset
x<-rnorm(100)
dim(x)<-c(10,10)
x<-data.frame(x)

# bind two columns
cb(x[1],x[5])

# bind five columns
cb(x,c(1,2,4,7,9))



