library(AnnotationDbi)


### Name: Bimap-envirAPI
### Title: Environment-like API for Bimap objects
### Aliases: Bimap-envirAPI ls ls,Bimap-method exists
###   exists,ANY,ANY,Bimap-method exists,ANY,Bimap,missing-method get
###   get,ANY,ANY,Bimap-method get,ANY,Bimap,missing-method [[,Bimap-method
###   $,Bimap-method mget mget,Bimap-method mget,ANY,Bimap-method eapply
###   eapply,Bimap-method contents,Bimap-method sample sample,Bimap-method
###   sample,environment-method
### Keywords: methods interface

### ** Examples

  library(hgu95av2.db)
  x <- hgu95av2CHRLOC

  ls(x)[1:3]
  exists(ls(x)[1], x)
  exists("titi", x)
  get(ls(x)[1], x)
  x[[ls(x)[1]]]
  x$titi # NULL

  mget(ls(x)[1:3], x)
  eapply(x, length)
  contents(x)

  sample(x, 3)



