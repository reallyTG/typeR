library(rlist)


### Name: list.class
### Title: Classify list elments into unique but non-exclusive cases
### Aliases: list.class

### ** Examples

x <-
  list(
    p1=list(name='Ken',age=24,
      interest=c('reading','music','movies'),
      lang=list(r=2,csharp=4,python=3)),
    p2=list(name='James',age=25,
      interest=c('sports','music'),
      lang=list(r=3,java=2,cpp=5)),
    p3=list(name='Penny',age=24,
      interest=c('movies','reading'),
      lang=list(r=1,cpp=4,python=2)))
list.class(x,interest)
list.class(x,names(lang))



