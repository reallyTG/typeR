library(RNeXML)


### Name: c,meta-method
### Title: Concatenate meta elements into a ListOfmeta
### Aliases: c,meta-method c-meta c,ListOfmeta-method c-ListOfmeta

### ** Examples

c(meta(content="example", property="dc:title"),
  meta(content="Carl", property="dc:creator"))
metalist <- c(meta(content="example", property="dc:title"),
              meta(content="Carl", property="dc:creator"))
out <- c(metalist, metalist) 
out <- c(metalist, meta(content="a", property="b")) 



