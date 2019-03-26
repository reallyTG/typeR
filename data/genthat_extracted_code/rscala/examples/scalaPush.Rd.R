library(rscala)


### Name: scalaPull
### Title: Push and Pull Objects Between R and Scala
### Aliases: scalaPull scalaPush

### ** Examples

## No test: 
s <- scala()

s(rn=scalaPush(rnorm),n=5) * 'R.evalD1("%-(%-)",rn,n)'

mtcarsRef <- scalaPush(mtcars, "list")
mtcarsRef$names()
mtcarsRef$mpg()
mtcars2 <- scalaPull(mtcarsRef, "list")
identical(mtcars, mtcars2)

# Oops, the variable names are bad...
tryCatch(ref <- scalaPush(iris, "list"), error=function(e) e)

# ... so let's clean up the variable names.
irisCleaned <- iris
names(irisCleaned) <- gsub("\\W","_",names(iris))
irisCleaned$Species <- as.character(iris$Species)
ref2 <- scalaPush(irisCleaned, "list")
scalaType(ref2)
ref2$Sepal_Length()
irisCleaned2 <- scalaPull(ref2,"list")
identical(irisCleaned, irisCleaned2)

close(s)
## End(No test)
 



