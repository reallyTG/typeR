library(TeachingDemos)


### Name: HWidentify
### Title: Show label for point being Hovered over.
### Aliases: HWidentify HTKidentify
### Keywords: dynamic iplot

### ** Examples

if( interactive() ){
  tmpx <- runif(25)
  tmpy <- rnorm(25)
  HTKidentify(tmpx,tmpy, LETTERS[1:25], pch=letters)
}



