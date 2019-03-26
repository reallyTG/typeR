library(crminer)


### Name: as_tdmurl
### Title: Coerce a url to a tdmurl with a specific type
### Aliases: as_tdmurl as_tdmurl.tdmurl as_tdmurl.character

### ** Examples

as_tdmurl("http://downloads.hindawi.com/journals/bmri/2014/201717.xml",
   "xml")
as_tdmurl("http://downloads.hindawi.com/journals/bmri/2014/201717.pdf",
   "pdf")
out <-
 as_tdmurl("http://downloads.hindawi.com/journals/bmri/2014/201717.pdf",
   "pdf", "10.1155/2014/201717")
attributes(out)
identical(attr(out, "type"), "pdf")



