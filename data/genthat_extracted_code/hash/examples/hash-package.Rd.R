library(hash)


### Name: hash-package
### Title: Hash/associative array/dictionary data structure for the R
###   language.
### Aliases: hash-package
### Keywords: package

### ** Examples


  h <- hash( keys=letters, values=1:26 )
  h <- hash( letters, 1:26 )

  h$a # 1

  h$foo <- "bar"
  h[ "foo" ] 
  h[[ "foo" ]]

  clear(h)
  rm(h)




