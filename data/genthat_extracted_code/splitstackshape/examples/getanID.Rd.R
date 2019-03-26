library(splitstackshape)


### Name: getanID
### Title: Add an "id" Variable to a Dataset
### Aliases: getanID

### ** Examples


mydf <- data.frame(IDA = c("a", "a", "a", "b", "b"),
                   IDB = c(1, 1, 1, 1, 1), values = 1:5)
mydf
getanID(mydf, c("IDA", "IDB"))

mydf <- data.frame(IDA = c("a", "a", "a", "b", "b"),
                   IDB = c(1, 2, 1, 1, 2), values = 1:5)
mydf
getanID(mydf, 1:2)

## Don't show: 
rm(mydf)
## End(Don't show)




