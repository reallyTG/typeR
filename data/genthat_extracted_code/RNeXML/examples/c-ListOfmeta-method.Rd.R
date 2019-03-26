library(RNeXML)


### Name: c,ListOfmeta-method
### Title: Concatenate ListOfmeta elements into a ListOfmeta
### Aliases: c,ListOfmeta-method

### ** Examples

metalist <- c(meta(content="example", property="dc:title"),
              meta(content="Carl", property="dc:creator"))
out <- c(metalist, metalist) 
out <- c(metalist, meta(content="a", property="b")) 



