library(hash)


### Name: hash
### Title: hash/associative array/dictionary data structure for the R
###   language
### Aliases: hash is.hash as.list.hash
### Keywords: data manip

### ** Examples


  hash()

  hash( key=letters, values=1:26 )
  
  hash( 1:3, lapply(1:3, seq, 1 ))
  
  hash( a=1, b=2, c=3 )
  hash( c(a=1, b=2, c=3) ) 
  hash( list(a=1,b=2,c=3) )

  hash( c("foo","bar","baz"), 1:3 )
  hash( c("foo","bar","baz"),  lapply(1:3, seq, 1 ) )
  hash( letters, 1:26 )

  h <- hash( letters, 1:26 )
  h$a
  h$b
  h[[ "a" ]]
  h[ letters[1:3] ]

  h$a<-100
  # h[['a']]<-letters

  is.hash(h)
  as.list(h)

  clear(h)
  rm(h)




