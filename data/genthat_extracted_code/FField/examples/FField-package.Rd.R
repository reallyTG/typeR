library(FField)


### Name: FField-package
### Title: Force field simulation for a set of points
### Aliases: FField FField-package
### Keywords: package

### ** Examples

# Repel points
coords <-
  FFieldPtRep(coords = cbind(mtcars$wt * 100 / max(mtcars$wt), 
                             mtcars$mpg * 100 / max(mtcars$mpg)),
              rep.fact = 40)
head(mtcars)
head(coords)
  
# Demo
FFieldPtRepDemo()



