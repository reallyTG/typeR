library(hash)


### Name: values
### Title: Extract values of a hash object.
### Aliases: values values-methods values,hash-method values<-
###   values<--methods values<-,hash-method values<-,hash,ANY-method
### Keywords: methods data manip

### ** Examples


  h <- hash( letters, 1:26 )
  values(h)  # 1:26
  values(h, simplify = FALSE )
  values(h, USE.NAMES = FALSE )

  h <- hash( 1:26, letters )
  values(h) 
  values(h, keys=1:5 )
  values(h, keys=c(1,1,1:5) )
  values(h, keys=1:5) <- 6:10 
  values(h) <- rev( letters )




