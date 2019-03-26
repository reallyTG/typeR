library(restfulr)


### Name: Media-class
### Title: Media
### Aliases: class:Media Media-class class:application/*
###   application/*-class class:audio/* audio/*-class class:image/*
###   image/*-class class:message/* message/*-class class:model/*
###   model/*-class class:multipart/* multipart/*-class class:text/*
###   text/*-class class:video/* video/*-class class:text/plain
###   text/plain-class class:text/html text/html-class class:text/csv
###   text/csv-class class:application/xml application/xml-class
###   class:application/json application/json-class mediaCoercionTable
###   length,NullMedia-method mediaTarget
###   mediaTarget,application/json-method
###   mediaTarget,application/xml-method mediaTarget,text/html-method
###   mediaTarget,text/csv-method mediaTarget,text/*-method
###   mediaTarget,NullMedia-method coerce,application/json,list-method
###   coerce,data.frame,text/csv-method
###   coerce,application/xml,XMLAbstractNode-method
###   coerce,text/csv,data.frame-method coerce,ANY,Media-method
###   coerce,list,application/json-method coerce,data.frame,Media-method
###   show,Media-method
### Keywords: methods classes

### ** Examples

txt <- '{"json":{"rocks":true}}'
json <- as(txt, "application/json")
as(json, mediaTarget(json))



