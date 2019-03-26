library(agricolae)


### Name: design.graeco
### Title: Graeco - latin square design
### Aliases: design.graeco
### Keywords: design

### ** Examples

library(agricolae)
T1<-c("a","b","c","d")
T2<-c("v","w","x","y")
outdesign <- design.graeco(T1,T2,serie=1)
graeco<-outdesign$book
plots <-as.numeric(graeco[,1])
print(outdesign$sketch)
print(matrix(plots,byrow=TRUE,ncol=4))
# 10 x 10
T1 <- letters[1:10]
T2 <- 1:10
outdesign <-  design.graeco(T1,T2,serie=2)
print(outdesign$sketch)



