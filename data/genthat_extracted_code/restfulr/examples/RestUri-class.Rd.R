library(restfulr)


### Name: RestUri-class
### Title: RestUri
### Aliases: class:RestUri RestUri-class create create,RestUri-method read
###   read,RestUri-method update update,RestUri-method delete
###   delete,RestUri-method create,character-method read,character-method
###   update,character-method delete,character-method RestUri
###   $,RestUri-method [[,RestUri-method $<-,RestUri-method
###   [[<-,RestUri-method [,RestUri-method container
###   container,RestUri-method container<- container<-,RestUri-method
###   purgeCache purgeCache,RestUri-method embedCredentials authenticate
###   authenticate,RestUri-method credentials,RestUri-method
###   show,RestUri-method
### Keywords: methods classes

### ** Examples

apache <- RestUri("http://wiki.apache.org")
read(apache$solr)



