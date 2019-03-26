library(yuima)


### Name: setData
### Title: Set and access data of an object of type "yuima.data" or
###   "yuima".
### Aliases: setData get.zoo.data dim length cbind.yuima
### Keywords: ts

### ** Examples

X <- ts(matrix(rnorm(200),100,2))
mydata <- setData(X)
str(get.zoo.data(mydata))
dim(mydata)
length(mydata)
plot(mydata)

# exactly the same output
mysde <- setYuima(data=setData(X))
str(get.zoo.data(mysde))
plot(mysde)
dim(mysde)
length(mysde)

# changing delta on the fly to 1/252
mysde2 <- setYuima(data=setData(X, delta=1/252))
str(get.zoo.data(mysde2))
plot(mysde2)
dim(mysde2)
length(mysde2)

# changing delta on the fly to 1/252 and shifting time to t0=1
mysde2 <- setYuima(data=setData(X, delta=1/252, t0=1))
str(get.zoo.data(mysde2))
plot(mysde2)
dim(mysde2)
length(mysde2)





