library(expperm)


### Name: heap
### Title: Heap's algorithm for enumerating permutations
### Aliases: heap

### ** Examples

n<-4
permi<-1:n
allperms<-c()
for(i in 1:factorial(n)){
  allperms<-rbind(allperms,permi)
  permi<-heap(permi)
}
allperms



