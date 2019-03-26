library(caroline)


### Name: parseArgString
### Title: Process Command Line Arguments
### Aliases: parseArgString
### Keywords: manip

### ** Examples


## passes
parseArgString('apple,banana,pear', param.range=c("apple","banana","pear","pineapple"))
parseArgString('1,2,3', param.range=c(1,4))


## fails
## Not run: 
##D parseArgString('apple,banana,pear', param.range=c("apple","banana"))
##D parseArgString('1,2,3', param.range=c(1,2))
## End(Not run)




