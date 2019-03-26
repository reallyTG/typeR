library(cgwtools)


### Name: askrm
### Title: Interactive application of selected function a list of objects.
### Aliases: askrm

### ** Examples

# get rid of junky objects left around from testing
foo<-1
afoo<-c(foo,2)
foob <- c('a','b','d')
askrm(ls(pattern="foo") )

x<- rep(1,10)
y<- runif(10)
askrm(c('x','y'),'sd',ask=FALSE)



