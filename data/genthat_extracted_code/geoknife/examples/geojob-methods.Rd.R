library(geoknife)


### Name: geojob
### Title: create geojob object
### Aliases: geojob geojob,missing-method geojob,geojob-method
###   geojob,xml_document-method geojob,character-method xml<-
###   xml<-,geojob-method xml xml,geojob-method id<- id,geojob-method id
###   id<-,geojob-method id,character-method

### ** Examples

xml <- "<foo> <bar> text <baz/> </bar> </foo>"
gj <- geojob()
xml(gj) <- xml
xml(gj)
xml <- "<foo version=\"1.0.0\"> <bar> text <baz/> </bar> </foo>"
gj <- geojob(xml = xml)
xml(gj)
id(gj)



