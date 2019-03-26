library(MEPDF)


### Name: ekde
### Title: ekde
### Aliases: ekde

### ** Examples

library("pracma")
library("plyr")

data<-cbind(rnorm(1000),rnorm(1000))
pdf<-ekde(x = 0,data = data, rule = "silverman",kernel = normkernel)



