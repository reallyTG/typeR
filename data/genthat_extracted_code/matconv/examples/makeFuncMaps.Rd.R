library(matconv)


### Name: makeFuncMaps
### Title: Turn dictionary lines into functions that map matlab to R
###   function calls
### Aliases: makeFuncMaps

### ** Examples


funcMap <- makeFuncMaps("trace: sum, diag(%1)")
funcMap[['trace']]$argMap[[1]]("matThing")
#$rargs
# "sum(diag(matThing)"

funcMap <- makeFuncMaps("mod: , 1 %% 2")
funcMap[['mod']]$argMap[[1]](c(4, 2))
#$rargs
# "(4, %%, 2"

test1 <- "mat"
test2 <- c("mat", "2")

funcMap <- makeFuncMaps(c("size--if 1:dim, 1", "size--if 2: ,dim(%1)[%2]"))
rightConv <- funcMap$size$flags$multSwitch(test1)
funcMap$size$argMap[[rightConv]](test1)
#$rargs
 "dim(mat"
 
rightConv <- funcMap$size$flags$multSwitch(test2)
funcMap$size$argMap[[rightConv]](test2)
#$rargs
 "dim(mat)[2]"



