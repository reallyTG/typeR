library(CEGO)


### Name: landscapeGeneratorUNI
### Title: Unimodal Fitness Landscape
### Aliases: landscapeGeneratorUNI

### ** Examples

fun <- landscapeGeneratorUNI(ref=1:7,distancePermutationCos)
## for single solutions, note that the function still requires list input:
x <- 1:7
fun(list(x))
x <- 7:1
fun(list(x))
x <- sample(7)
fun(list(x))
## multiple solutions at once:
x <- replicate(5,sample(7),FALSE)
fun(x)




