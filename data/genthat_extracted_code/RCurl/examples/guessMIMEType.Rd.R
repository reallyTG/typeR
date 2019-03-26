library(RCurl)


### Name: guessMIMEType
### Title: Infer the MIME type from a file name
### Aliases: guessMIMEType
### Keywords: IO

### ** Examples

 guessMIMEType(c("foo.txt", "foo.png", "foo.jpeg", "foo.Z", "foo.R"))

 guessMIMEType("foo.bob")
 guessMIMEType("foo.bob", "application/x-binary")



