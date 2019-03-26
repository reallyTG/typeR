library(CEGO)


### Name: landscapeGeneratorMUL
### Title: Multimodal Fitness Landscape
### Aliases: landscapeGeneratorMUL

### ** Examples

fun <- landscapeGeneratorMUL(ref=list(1:7,c(2,4,1,5,3,7,6)),distancePermutationCos)
x <- 1:7
fun(list(x))
x <- c(2,4,1,5,3,7,6)
fun(list(x))
x <- 7:1
fun(list(x))
x <- sample(7)
fun(list(x))
## multiple solutions at once:
x <- append(list(1:7,c(2,4,1,5,3,7,6)),replicate(5,sample(7),FALSE))
fun(x)




