library(XML)


### Name: Doctype
### Title: Constructor for DTD reference
### Aliases: Doctype coerce,Doctype,character-method
### Keywords: IO

### ** Examples


  d = Doctype(name = "section",
              public = c("-//OASIS//DTD DocBook XML V4.2//EN",
                         "http://oasis-open.org/docbook/xml/4.2/docbookx.dtd"))
  as(d, "character")

   # this call switches the system to the URI associated with the PUBLIC element.
  d = Doctype(name = "section",
              public = c("-//OASIS//DTD DocBook XML V4.2//EN"),
              system = "http://oasis-open.org/docbook/xml/4.2/docbookx.dtd")



