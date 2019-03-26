library(dummies)


### Name: dummy
### Title: Flexible, efficient creation of dummy variables.
### Aliases: dummy dummy.data.frame
### Keywords: manip models

### ** Examples


  letters <- c( "a", "a", "b", "c", "d", "e", "f", "g", "h", "b", "b" )
  dummy( as.character(letters) )
  dummy( letters[1:6] )
  
  l <- as.factor(letters)[ c(1:3,1:6,4:6) ]
  dummy(l)
  dummy(l, drop=FALSE)
  dummy(l, sep=":")
  dummy(l, sep="::", fun=as.logical)
  
  # TESTING NAS
  l <- c( NA, l, NA)
  dummy(l)
  dummy(l,sep=":")
  
  
  dummy(iris$Species)
  dummy(iris$Species[ c(1:3,51:53,101:103) ] )
  dummy(iris$Species[ c(1:3,51:53,101:103) ], sep=":" )
  dummy(iris$Species[ c(1:3,51:53) ], sep=":", drop=FALSE )     
  

  # TESTING TRAP FOR ONE LEVEL
  dummy( as.factor(letters)[c(1,1,1,1)] )
  dummy( as.factor(letters)[c(1,1,2,2)] )
  dummy( as.factor(letters)[c(1,1,1,1)] , drop = FALSE )   

  
  dummy.data.frame(iris)
  dummy.data.frame(iris, all=FALSE)


  dummy.data.frame(iris, dummy.class="numeric" )
  dummy.data.frame(iris, dummy.class="ALL" )





