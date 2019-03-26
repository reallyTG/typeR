library(spatstat)


### Name: split.ppx
### Title: Divide Multidimensional Point Pattern into Sub-patterns
### Aliases: split.ppx
### Keywords: spatial methods manip

### ** Examples

   df <- data.frame(x=runif(4),y=runif(4),t=runif(4),
                    age=rep(c("old", "new"), 2),
                    size=runif(4))
   X <- ppx(data=df, coord.type=c("s","s","t","m","m"))
   X
   split(X)



