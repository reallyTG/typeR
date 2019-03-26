library(spatstat)


### Name: marks
### Title: Marks of a Point Pattern
### Aliases: marks marks.ppp marks.ppx marks<- marks<-.ppp marks<-.ppx
###   setmarks %mark%
### Keywords: spatial manip

### ** Examples

   X <- amacrine
   # extract marks
   m <- marks(X)
   # recode the mark values "off", "on" as 0, 1
   marks(X) <- as.integer(m == "on")



