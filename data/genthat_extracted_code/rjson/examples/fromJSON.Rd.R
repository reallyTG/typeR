library(rjson)


### Name: fromJSON
### Title: Convert JSON To R
### Aliases: fromJSON
### Keywords: interface

### ** Examples


fromJSON('[1,2,3]', simplify=TRUE)
# returns c(1,2,3)
fromJSON('[1,2,3]', simplify=FALSE)
# returns list(1,2,3)

#As a result, this will output "1"
toJSON(fromJSON('[1]', simplify=TRUE))
#Compared with this which will output "[1]" as expected
toJSON(fromJSON('[1]', simplify=TRUE))

#R vs C execution time
x <- toJSON( iris )
system.time( y <- fromJSON(x) )
system.time( y2 <- fromJSON(x,method = "R") )




