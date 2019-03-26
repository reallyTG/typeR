library(hash)


### Name: hash-accessors
### Title: Accessor methods for the hash class.
### Aliases: hash-accessors $,hash-method $<-,hash-method
###   $<-,hash,ANY-method $<-,hash,ANY,NULL-method $<-,hash,ANY,ANY-method
###   $<-,hash,missing,NULL-method $<-,hash,NULL-method
###   [,hash,missing,missing,missing-method
###   [,hash,ANY,missing,missing-method [<-,hash,ANY,missing-method
###   [<-,hash,ANY,missing,ANY-method [<-,hash,ANY,missing,NULL-method
###   [[,hash,ANY,missing-method [[<-,hash,ANY,missing-method
###   [[<-,hash,ANY,missing,ANY-method [[<-,hash,ANY,missing,NULL-method
### Keywords: methods data manip

### ** Examples


  h <- hash()
  h <- hash( letters, 1:26 )

  h$a 			
  h$a <- "2"   
  h$z <- NULL          # Removes 'z' from 

  h[['a']] 
  h[['a']] <- 23

  h[ letters[1:4] ]    # hash with a,b,c,d
  h[ letters[1:4] ] <- 4:1




