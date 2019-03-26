library(GCAI.bias)


### Name: index.mat.generation
### Title: Index Matrix Generation
### Aliases: index.mat.generation
### Keywords: initialization

### ** Examples

word<-81
word.vec<-c("A","T","C","G")
pos.vec<-c((-(word-1)/2):((word-1)/2))

obj.index<-index.mat.generation(word.vec,pos.vec)



